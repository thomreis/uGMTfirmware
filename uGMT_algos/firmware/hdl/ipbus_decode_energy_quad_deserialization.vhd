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

package ipbus_decode_energy_quad_deserialization is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_energy_quad_deserialization(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Tue Feb  9 13:17:22 2016 
  constant N_SLV_BC0_ERRORS_0: integer := 0;
  constant N_SLV_BC0_ERRORS_1: integer := 1;
  constant N_SLV_BC0_ERRORS_2: integer := 2;
  constant N_SLV_BC0_ERRORS_3: integer := 3;
  constant N_SLV_BNCH_CNT_ERRORS_0: integer := 4;
  constant N_SLV_BNCH_CNT_ERRORS_1: integer := 5;
  constant N_SLV_BNCH_CNT_ERRORS_2: integer := 6;
  constant N_SLV_BNCH_CNT_ERRORS_3: integer := 7;
  constant N_SLAVES: integer := 8;
-- END automatically generated VHDL

    
end ipbus_decode_energy_quad_deserialization;

package body ipbus_decode_energy_quad_deserialization is

  function ipbus_sel_energy_quad_deserialization(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Tue Feb  9 13:17:22 2016 
    if    std_match(addr, "-------------------------0000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BC0_ERRORS_0, IPBUS_SEL_WIDTH)); -- bc0_errors_0 / base 0x00000000 / mask 0x0000007f
    elsif std_match(addr, "-------------------------0000001") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BC0_ERRORS_1, IPBUS_SEL_WIDTH)); -- bc0_errors_1 / base 0x00000001 / mask 0x0000007f
    elsif std_match(addr, "-------------------------0000010") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BC0_ERRORS_2, IPBUS_SEL_WIDTH)); -- bc0_errors_2 / base 0x00000002 / mask 0x0000007f
    elsif std_match(addr, "-------------------------0000100") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BC0_ERRORS_3, IPBUS_SEL_WIDTH)); -- bc0_errors_3 / base 0x00000004 / mask 0x0000007f
    elsif std_match(addr, "-------------------------0001000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BNCH_CNT_ERRORS_0, IPBUS_SEL_WIDTH)); -- bnch_cnt_errors_0 / base 0x00000008 / mask 0x0000007f
    elsif std_match(addr, "-------------------------0010000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BNCH_CNT_ERRORS_1, IPBUS_SEL_WIDTH)); -- bnch_cnt_errors_1 / base 0x00000010 / mask 0x0000007f
    elsif std_match(addr, "-------------------------0100000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BNCH_CNT_ERRORS_2, IPBUS_SEL_WIDTH)); -- bnch_cnt_errors_2 / base 0x00000020 / mask 0x0000007f
    elsif std_match(addr, "-------------------------1000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BNCH_CNT_ERRORS_3, IPBUS_SEL_WIDTH)); -- bnch_cnt_errors_3 / base 0x00000040 / mask 0x0000007f
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_energy_quad_deserialization;

end ipbus_decode_energy_quad_deserialization;

