library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use work.GMTTypes.all;

entity GhostCheckerUnit_BMTF is
  port (mu1    : in  TBMTFTrackAddress;
        qual1  : in  unsigned(3 downto 0);
        mu2    : in  TBMTFTrackAddress;
        qual2  : in  unsigned(3 downto 0);
        ghost1 : out std_logic;
        ghost2 : out std_logic);
end GhostCheckerUnit_BMTF;

architecture Behavioral of GhostCheckerUnit_BMTF is
  signal matchedStation : boolean := false;  -- whether a track segement was shared between two tracks
begin

  P : process(mu1, mu2, qual1, qual2, matchedstations)
  begin
      -- TODO: Loop over all stations. Need to make station container an array.
      for station in 0 to 2 loop
        -- TODO: Do I need station 1 address?
        -- If candidates are in same wheel on same side
        if ((mu1.detectorSide = mu2.detectorSide) and (mu1.wheelNo = mu2.wheelNo)) then
          if (mu1.stationAddresses[station] = X"8" and mu2.stationAddresses[station] = X"A") or
             (mu1.stationAddresses[station] = X"9" and mu2.stationAddresses[station] = X"B") or
             (mu1.stationAddresses[station] = X"C" and mu2.stationAddresses[station] = X"8") or
             (mu1.stationAddresses[station] = X"D" and mu2.stationAddresses[station] = X"9") or
             (mu1.stationAddresses[station] = X"0" and mu2.stationAddresses[station] = X"2") or
             (mu1.stationAddresses[station] = X"1" and mu2.stationAddresses[station] = X"3") or
             (mu1.stationAddresses[station] = X"4" and mu2.stationAddresses[station] = X"0") or
             (mu1.stationAddresses[station] = X"5" and mu2.stationAddresses[station] = X"1") then
            matchedStation <= true;
          end if;
        -- If candidates are in same side and candidate 2 is one wheel in front of candidate 1.
        elsif (mu1.detectorSide = mu2.detectorSide) and
              ((mu1.wheelNo = 1 and mu2.wheelNo = 2) or
               (mu1.wheelNo = 2 and mu2.wheelNo = 3)) then
          if (mu1.stationAddresses[station] = X"0" and mu2.stationAddresses[station] = X"A") or
             (mu1.stationAddresses[station] = X"1" and mu2.stationAddresses[station] = X"B") or
             (mu1.stationAddresses[station] = X"4" and mu2.stationAddresses[station] = X"8") or
             (mu1.stationAddresses[station] = X"5" and mu2.stationAddresses[station] = X"9") then
            matchedStation <= true;
          end if;
        -- If candidates are in same side and candidate 2 is one wheel behind candidate 1.
        elsif (mu1.detectorSide = mu2.detectorSide) and
              ((mu1.wheelNo = 2 and mu2.wheelNo = 1) or
               (mu1.wheelNo = 3 and mu2.wheelNo = 2)) then
          if (mu1.stationAddresses[station] = X"8" and mu2.stationAddresses[station] = X"2") or
             (mu1.stationAddresses[station] = X"9" and mu2.stationAddresses[station] = X"3") or
             (mu1.stationAddresses[station] = X"C" and mu2.stationAddresses[station] = X"0") or
             (mu1.stationAddresses[station] = X"D" and mu2.stationAddresses[station] = X"1") then
            matchedStation <= true;
          end if;
        --  If one muon in 0+ and one muon in 0- (0+ and 0- are physically the same wheel)
        elsif ((mu1.wheelNo = WHEEL_ZERO_POS) and (mu2.wheelNo = WHEEL_ZERO_NEG)) or
              ((mu1.wheelNo = WHEEL_ZERO_NEG) and (mu2.wheelNo = WHEEL_ZERO_POS)) then
            if (mu1.stationAddresses[station] = X"8" and mu2.stationAddresses[station] = X"A") or
               (mu1.stationAddresses[station] = X"9" and mu2.stationAddresses[station] = X"B") then
               matchedStation <= true;
            end if;
        end if;
      end loop;
  end process;

  check_ghosts : process (match, qual1, qual2, deltaPhi, deltaEta)
  begin  -- process check_ghosts
    -- If the muons are 'far enough' apart we don't check the LUT output.
    if match = true then
      if qual1 > qual2 then
        ghost1 <= '0';
        ghost2 <= '1';
      else
        ghost1 <= '1';
        ghost2 <= '0';
      end if;
    else
      ghost1 <= '0';
      ghost2 <= '0';
    end if;
  end process check_ghosts;

end Behavioral;
