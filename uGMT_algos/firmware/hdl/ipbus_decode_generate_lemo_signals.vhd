-- Address decode logic for ipbus fabric
-- 
-- This file has been AUTOGENERATED from the address table - do not hand edit
-- 
-- We assume the synthesis tool is clever enough to recognise exclusive conditions
-- in the if statement.
-- 
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package ipbus_decode_generate_lemo_signals is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_generate_lemo_signals(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Thu Sep 17 15:25:05 2015 
  constant N_SLV_PRESCALE: integer := 0;
  constant N_SLAVES: integer := 1;
-- END automatically generated VHDL

    
end ipbus_decode_generate_lemo_signals;

package body ipbus_decode_generate_lemo_signals is

  function ipbus_sel_generate_lemo_signals(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Thu Sep 17 15:25:05 2015 
    if    std_match(addr, "--------------------------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PRESCALE, IPBUS_SEL_WIDTH)); -- prescale / base 0x00000000 / mask 0x00000000
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_generate_lemo_signals;

end ipbus_decode_generate_lemo_signals;

