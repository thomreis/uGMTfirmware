-- Generic counter
--
-- Counters have to be reset manually.
--
-- Dinyar Rabady, May 2015
-- modified code by Dave Newbold, May 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_permanent_counter is
  port(
    clk          : in  std_logic;
    reset        : in  std_logic;
    ipbus_in     : in  ipb_wbus;
    ipbus_out    : out ipb_rbus;
    incr_counter : in  std_logic
  );
end ipbus_permanent_counter;

architecture rtl of ipbus_permanent_counter is

  signal ctr: unsigned(31 downto 0);

begin

  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        ctr <= (others => '0');
      else
        if incr_counter = '1' then
          ctr <= ctr + 1;
        end if;
      end if;
    end if;
  end process;

  ipbus_out.ipb_rdata <= std_logic_vector(ctr);
  ipbus_out.ipb_ack <= ipbus_in.ipb_strobe;
  ipbus_out.ipb_err <= '0';

end rtl;
