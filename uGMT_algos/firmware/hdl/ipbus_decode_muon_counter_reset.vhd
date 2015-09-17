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

package ipbus_decode_muon_counter_reset is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_muon_counter_reset(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Thu Sep 17 15:25:05 2015 
  constant N_SLV_MANUAL_RESET_SEL: integer := 0;
  constant N_SLV_MANUAL_RESET_CTRL: integer := 1;
  constant N_SLV_LUMI_SECTION_CNT: integer := 2;
  constant N_SLAVES: integer := 3;
-- END automatically generated VHDL

    
end ipbus_decode_muon_counter_reset;

package body ipbus_decode_muon_counter_reset is

  function ipbus_sel_muon_counter_reset(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Thu Sep 17 15:25:05 2015 
    if    std_match(addr, "------------------------------00") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_MANUAL_RESET_SEL, IPBUS_SEL_WIDTH)); -- manual_reset_sel / base 0x00000000 / mask 0x00000003
    elsif std_match(addr, "------------------------------01") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_MANUAL_RESET_CTRL, IPBUS_SEL_WIDTH)); -- manual_reset_ctrl / base 0x00000001 / mask 0x00000003
    elsif std_match(addr, "------------------------------10") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_LUMI_SECTION_CNT, IPBUS_SEL_WIDTH)); -- lumi_section_cnt / base 0x00000002 / mask 0x00000003
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_muon_counter_reset;

end ipbus_decode_muon_counter_reset;

