-- Sorter 36 -> 8

library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

library Types;
use Types.GMTTypes.all;

-- Do I need this?
--library LogicFPGA;
--use LogicFPGA.LFTiming.all;

library Common;
use Common.SorterUnit.all;

entity HalfSortStage0 is
  generic (
    sorter_lat_start : integer := 6);                 -- start latency
  port (iSortRanks : in  TSortRank10_vector(0 to 17);
        iEmpty     : in  std_logic_vector(0 to 17);   -- arrive 1/2 bx later?
        iCancel_A  : in  std_logic_vector(0 to 17);   -- arrive 1/2 bx later
        iCancel_B  : in  std_logic_vector(0 to 17);   -- arrive 1/2 bx later
        iCancel_C  : in  std_logic_vector(0 to 17);   -- arrive 1/2 bx later
        iMuons     : in  TGMTMu_vector(0 to 17);      -- arrive 1/2 bx later?
        iIdxBits   : in  TIndexBits_vector(0 to 17);  -- arrive 1/2 bx later?
        oMuons     : out TGMTMu_vector(0 to 3);
        oIdxBits   : out TIndexBits_vector(0 to 3);
        oSortRanks : out TSortRank10_vector(0 to 3);
        oEmpty     : out std_logic_vector(0 to 3);

        -- Clock and control
        clk   : in std_logic;
        sinit : in std_logic);
end;

architecture behavioral of HalfSortStage0 is
  attribute syn_useioff               : boolean;
  attribute syn_useioff of behavioral : architecture is true;

  component comp10_ge
    port (
      A      : in  std_logic_vector(9 downto 0);
      B      : in  std_logic_vector(9 downto 0);
      A_GE_B : out std_logic);
  end component;

-- Synplicity black box declaration
--  attribute syn_black_box              : boolean;
--  attribute syn_black_box of comp10_ge : component is true;

  signal sMuons_reg : TGMTMu_vector(0 to 17);

  signal GEMatrix, GEMatrix_reg : TGEMatrix18;

  signal sIdxBits     : TIndexBits_vector(0 to 17);
  signal sIdxBits_reg : TIndexBits_vector(0 to 17);

  signal sSortRanks     : TSortRank10_vector(0 to 17);
  signal sSortRanks_reg : TSortRank10_vector(0 to 17);

  signal sDisable : std_logic_vector(0 to 17);

  -- Not sure about this one..
  signal sSelBits : TSelBits_1_of_18_vec (0 to 17);
begin  -- architecture behavioral
  sIdxBits   <= iIdxBits;
  sSortRanks <= iSortRanks;

  -- If we receive a cancel signal from one of the two CU units or the entry is
  -- empty we will disable the corresponding muon.
  sDisable <= iEmpty or iCancel_A or iCancel_B or iCancel_C;

  -----------------------------------------------------------------------------
  -- calculate GE Matrix
  -----------------------------------------------------------------------------
  -- TODO: Check whether the following holds:
  -- Previous versions: If i runs up to 17 then j becomes 18 !!!
  --                        --> loop 36 to 17 ==> error message in Precision
  -- Dec 08: --> i runs up to 16
  --         --> comp36_ge (behavioral) used
  --         -- Remark: Diagonal elements of GEMatrix are never used and also
  --         not generated.
  g1 : for i in 0 to 16 generate
    g2 : for j in i+1 to 17 generate
      x : comp10_ge
        port map (
          A      => sSortRanks(i),
          B      => sSortRanks(j),
          A_GE_B => GEMatrix(i, j));

      -- in case of equal ranks the lower index muon wins
      GEMatrix(j, i) <= not GEMatrix(i, j);
    end generate;
  end generate;

  -----------------------------------------------------------------------------
  -- register the result and the empty inputs
  -----------------------------------------------------------------------------
  -- TODO: Is this flip-flop correct?
  reg_ge : process (clk) is
  begin  -- process reg_ge
    if clk'event and clk = '1' then
      GEMatrix_reg   <= GEMatrix;
      sIdxBits_reg   <= sIdxBits;
      sSortRanks_reg <= sSortRanks;
      sMuons_reg     <= iMuons;
    end if;
  end process reg_ge;

  -----------------------------------------------------------------------------
  -- sort and four 8 to 1 Muxes
  -----------------------------------------------------------------------------
  count_wins18(GEMatrix_reg, sDisable, sSelBits);

  mux : process (sSelBits, sMuons_reg, sSortRanks_reg, iEmpty, sIdxBits_reg) is
  begin
    for iplace in 0 to 3 loop
      case sSelBits(iplace) is
        when "100000000000000000" => oMuons(iplace) <= sMuons_reg(0);
        when "010000000000000000" => oMuons(iplace) <= sMuons_reg(1);
        when "001000000000000000" => oMuons(iplace) <= sMuons_reg(2);
        when "000100000000000000" => oMuons(iplace) <= sMuons_reg(3);
        when "000010000000000000" => oMuons(iplace) <= sMuons_reg(4);
        when "000001000000000000" => oMuons(iplace) <= sMuons_reg(5);
        when "000000100000000000" => oMuons(iplace) <= sMuons_reg(6);
        when "000000010000000000" => oMuons(iplace) <= sMuons_reg(7);
        when "000000001000000000" => oMuons(iplace) <= sMuons_reg(8);
        when "000000000100000000" => oMuons(iplace) <= sMuons_reg(9);
        when "000000000010000000" => oMuons(iplace) <= sMuons_reg(10);
        when "000000000001000000" => oMuons(iplace) <= sMuons_reg(11);
        when "000000000000100000" => oMuons(iplace) <= sMuons_reg(12);
        when "000000000000010000" => oMuons(iplace) <= sMuons_reg(13);
        when "000000000000001000" => oMuons(iplace) <= sMuons_reg(14);
        when "000000000000000100" => oMuons(iplace) <= sMuons_reg(15);
        when "000000000000000010" => oMuons(iplace) <= sMuons_reg(16);
        when "000000000000000001" => oMuons(iplace) <= sMuons_reg(17);
        when others                                 => oMuons(iplace) <= ("00", '0', "000000000", "0000", "000000000", "0000000000");
      end case;
      case sSelBits(iplace) is
        when "100000000000000000" => oSortRanks(iplace) <= sSortRanks_reg(0);
        when "010000000000000000" => oSortRanks(iplace) <= sSortRanks_reg(1);
        when "001000000000000000" => oSortRanks(iplace) <= sSortRanks_reg(2);
        when "000100000000000000" => oSortRanks(iplace) <= sSortRanks_reg(3);
        when "000010000000000000" => oSortRanks(iplace) <= sSortRanks_reg(4);
        when "000001000000000000" => oSortRanks(iplace) <= sSortRanks_reg(5);
        when "000000100000000000" => oSortRanks(iplace) <= sSortRanks_reg(6);
        when "000000010000000000" => oSortRanks(iplace) <= sSortRanks_reg(7);
        when "000000001000000000" => oSortRanks(iplace) <= sSortRanks_reg(8);
        when "000000000100000000" => oSortRanks(iplace) <= sSortRanks_reg(9);
        when "000000000010000000" => oSortRanks(iplace) <= sSortRanks_reg(10);
        when "000000000001000000" => oSortRanks(iplace) <= sSortRanks_reg(11);
        when "000000000000100000" => oSortRanks(iplace) <= sSortRanks_reg(12);
        when "000000000000010000" => oSortRanks(iplace) <= sSortRanks_reg(13);
        when "000000000000001000" => oSortRanks(iplace) <= sSortRanks_reg(14);
        when "000000000000000100" => oSortRanks(iplace) <= sSortRanks_reg(15);
        when "000000000000000010" => oSortRanks(iplace) <= sSortRanks_reg(16);
        when "000000000000000001" => oSortRanks(iplace) <= sSortRanks_reg(17);
        when others                                 => oSortRanks(iplace) <= (others => '0');
      end case;
      case sSelBits(iplace) is
        when "100000000000000000" => oEmpty(iplace) <= iEmpty(0);
        when "010000000000000000" => oEmpty(iplace) <= iEmpty(1);
        when "001000000000000000" => oEmpty(iplace) <= iEmpty(2);
        when "000100000000000000" => oEmpty(iplace) <= iEmpty(3);
        when "000010000000000000" => oEmpty(iplace) <= iEmpty(4);
        when "000001000000000000" => oEmpty(iplace) <= iEmpty(5);
        when "000000100000000000" => oEmpty(iplace) <= iEmpty(6);
        when "000000010000000000" => oEmpty(iplace) <= iEmpty(7);
        when "000000001000000000" => oEmpty(iplace) <= iEmpty(8);
        when "000000000100000000" => oEmpty(iplace) <= iEmpty(9);
        when "000000000010000000" => oEmpty(iplace) <= iEmpty(10);
        when "000000000001000000" => oEmpty(iplace) <= iEmpty(11);
        when "000000000000100000" => oEmpty(iplace) <= iEmpty(12);
        when "000000000000010000" => oEmpty(iplace) <= iEmpty(13);
        when "000000000000001000" => oEmpty(iplace) <= iEmpty(14);
        when "000000000000000100" => oEmpty(iplace) <= iEmpty(15);
        when "000000000000000010" => oEmpty(iplace) <= iEmpty(16);
        when "000000000000000001" => oEmpty(iplace) <= iEmpty(17);
        when others                                 => oEmpty(iplace) <= '1';
      end case;
      case sSelBits(iplace) is
        when "100000000000000000" => oIdxBits(iplace) <= sIdxBits_reg(0);
        when "010000000000000000" => oIdxBits(iplace) <= sIdxBits_reg(1);
        when "001000000000000000" => oIdxBits(iplace) <= sIdxBits_reg(2);
        when "000100000000000000" => oIdxBits(iplace) <= sIdxBits_reg(3);
        when "000010000000000000" => oIdxBits(iplace) <= sIdxBits_reg(4);
        when "000001000000000000" => oIdxBits(iplace) <= sIdxBits_reg(5);
        when "000000100000000000" => oIdxBits(iplace) <= sIdxBits_reg(6);
        when "000000010000000000" => oIdxBits(iplace) <= sIdxBits_reg(7);
        when "000000001000000000" => oIdxBits(iplace) <= sIdxBits_reg(8);
        when "000000000100000000" => oIdxBits(iplace) <= sIdxBits_reg(9);
        when "000000000010000000" => oIdxBits(iplace) <= sIdxBits_reg(10);
        when "000000000001000000" => oIdxBits(iplace) <= sIdxBits_reg(11);
        when "000000000000100000" => oIdxBits(iplace) <= sIdxBits_reg(12);
        when "000000000000010000" => oIdxBits(iplace) <= sIdxBits_reg(13);
        when "000000000000001000" => oIdxBits(iplace) <= sIdxBits_reg(14);
        when "000000000000000100" => oIdxBits(iplace) <= sIdxBits_reg(15);
        when "000000000000000010" => oIdxBits(iplace) <= sIdxBits_reg(16);
        when "000000000000000001" => oIdxBits(iplace) <= sIdxBits_reg(17);
        when others                                 => oIdxBits(iplace) <= (others => '0');
      end case;
    end loop;  -- iplace
  end process mux;

end architecture behavioral;
