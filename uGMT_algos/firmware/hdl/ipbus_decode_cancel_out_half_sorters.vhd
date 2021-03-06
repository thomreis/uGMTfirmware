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

package ipbus_decode_cancel_out_half_sorters is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_cancel_out_half_sorters(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Thu Mar  3 03:05:20 2016 
  constant N_SLV_CANCEL_OUT_MEMS_0: integer := 0;
  constant N_SLV_CANCEL_OUT_MEMS_1: integer := 1;
  constant N_SLV_CANCEL_OUT_MEMS_2: integer := 2;
  constant N_SLV_CANCEL_OUT_MEMS_3: integer := 3;
  constant N_SLV_CANCEL_OUT_MEMS_4: integer := 4;
  constant N_SLV_CANCEL_OUT_MEMS_5: integer := 5;
  constant N_SLAVES: integer := 6;
-- END automatically generated VHDL

    
end ipbus_decode_cancel_out_half_sorters;

package body ipbus_decode_cancel_out_half_sorters is

  function ipbus_sel_cancel_out_half_sorters(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Thu Mar  3 03:05:20 2016 
    if    std_match(addr, "------------------000-----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEMS_0, IPBUS_SEL_WIDTH)); -- cancel_out_mems_0 / base 0x00000000 / mask 0x00003800
    elsif std_match(addr, "------------------001-----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEMS_1, IPBUS_SEL_WIDTH)); -- cancel_out_mems_1 / base 0x00000800 / mask 0x00003800
    elsif std_match(addr, "------------------010-----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEMS_2, IPBUS_SEL_WIDTH)); -- cancel_out_mems_2 / base 0x00001000 / mask 0x00003800
    elsif std_match(addr, "------------------011-----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEMS_3, IPBUS_SEL_WIDTH)); -- cancel_out_mems_3 / base 0x00001800 / mask 0x00003800
    elsif std_match(addr, "------------------100-----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEMS_4, IPBUS_SEL_WIDTH)); -- cancel_out_mems_4 / base 0x00002000 / mask 0x00003800
    elsif std_match(addr, "------------------101-----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEMS_5, IPBUS_SEL_WIDTH)); -- cancel_out_mems_5 / base 0x00002800 / mask 0x00003800
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_cancel_out_half_sorters;

end ipbus_decode_cancel_out_half_sorters;

