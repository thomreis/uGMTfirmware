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

package ipbus_decode_spy_buffer_control is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_spy_buffer_control(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Thu Mar  3 03:05:20 2016 
  constant N_SLV_SPY_BUFFER_0: integer := 0;
  constant N_SLV_SPY_BUFFER_1: integer := 1;
  constant N_SLV_SPY_BUFFER_2: integer := 2;
  constant N_SLV_SPY_BUFFER_3: integer := 3;
  constant N_SLAVES: integer := 4;
-- END automatically generated VHDL

    
end ipbus_decode_spy_buffer_control;

package body ipbus_decode_spy_buffer_control is

  function ipbus_sel_spy_buffer_control(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Thu Mar  3 03:05:20 2016 
    if    std_match(addr, "------------------00------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SPY_BUFFER_0, IPBUS_SEL_WIDTH)); -- spy_buffer_0 / base 0x00000000 / mask 0x00003000
    elsif std_match(addr, "------------------01------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SPY_BUFFER_1, IPBUS_SEL_WIDTH)); -- spy_buffer_1 / base 0x00001000 / mask 0x00003000
    elsif std_match(addr, "------------------10------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SPY_BUFFER_2, IPBUS_SEL_WIDTH)); -- spy_buffer_2 / base 0x00002000 / mask 0x00003000
    elsif std_match(addr, "------------------11------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SPY_BUFFER_3, IPBUS_SEL_WIDTH)); -- spy_buffer_3 / base 0x00003000 / mask 0x00003000
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_spy_buffer_control;

end ipbus_decode_spy_buffer_control;

