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

package ipbus_decode_cancel_out_mems is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_cancel_out_mems(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Thu Mar  3 03:05:20 2016 
  constant N_SLV_CANCEL_OUT_MEM_0: integer := 0;
  constant N_SLV_CANCEL_OUT_MEM_1: integer := 1;
  constant N_SLV_CANCEL_OUT_MEM_2: integer := 2;
  constant N_SLV_CANCEL_OUT_MEM_3: integer := 3;
  constant N_SLV_CANCEL_OUT_MEM_4: integer := 4;
  constant N_SLV_CANCEL_OUT_MEM_5: integer := 5;
  constant N_SLV_CANCEL_OUT_MEM_6: integer := 6;
  constant N_SLV_CANCEL_OUT_MEM_7: integer := 7;
  constant N_SLV_CANCEL_OUT_MEM_8: integer := 8;
  constant N_SLAVES: integer := 9;
-- END automatically generated VHDL

    
end ipbus_decode_cancel_out_mems;

package body ipbus_decode_cancel_out_mems is

  function ipbus_sel_cancel_out_mems(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Thu Mar  3 03:05:20 2016 
    if    std_match(addr, "---------------------0000-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_0, IPBUS_SEL_WIDTH)); -- cancel_out_mem_0 / base 0x00000000 / mask 0x00000780
    elsif std_match(addr, "---------------------0001-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_1, IPBUS_SEL_WIDTH)); -- cancel_out_mem_1 / base 0x00000080 / mask 0x00000780
    elsif std_match(addr, "---------------------0010-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_2, IPBUS_SEL_WIDTH)); -- cancel_out_mem_2 / base 0x00000100 / mask 0x00000780
    elsif std_match(addr, "---------------------0011-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_3, IPBUS_SEL_WIDTH)); -- cancel_out_mem_3 / base 0x00000180 / mask 0x00000780
    elsif std_match(addr, "---------------------0100-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_4, IPBUS_SEL_WIDTH)); -- cancel_out_mem_4 / base 0x00000200 / mask 0x00000780
    elsif std_match(addr, "---------------------0101-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_5, IPBUS_SEL_WIDTH)); -- cancel_out_mem_5 / base 0x00000280 / mask 0x00000780
    elsif std_match(addr, "---------------------0110-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_6, IPBUS_SEL_WIDTH)); -- cancel_out_mem_6 / base 0x00000300 / mask 0x00000780
    elsif std_match(addr, "---------------------0111-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_7, IPBUS_SEL_WIDTH)); -- cancel_out_mem_7 / base 0x00000380 / mask 0x00000780
    elsif std_match(addr, "---------------------1000-------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_MEM_8, IPBUS_SEL_WIDTH)); -- cancel_out_mem_8 / base 0x00000400 / mask 0x00000780
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_cancel_out_mems;

end ipbus_decode_cancel_out_mems;

