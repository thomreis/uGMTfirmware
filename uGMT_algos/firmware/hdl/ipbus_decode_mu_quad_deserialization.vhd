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

package ipbus_decode_mu_quad_deserialization is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_mu_quad_deserialization(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Thu Sep 17 15:25:05 2015 
  constant N_SLV_SORT_RANK_MEM_0: integer := 0;
  constant N_SLV_SORT_RANK_MEM_1: integer := 1;
  constant N_SLV_SORT_RANK_MEM_2: integer := 2;
  constant N_SLV_SORT_RANK_MEM_3: integer := 3;
  constant N_SLV_BC0_ERRORS_0: integer := 4;
  constant N_SLV_BC0_ERRORS_1: integer := 5;
  constant N_SLV_BC0_ERRORS_2: integer := 6;
  constant N_SLV_BC0_ERRORS_3: integer := 7;
  constant N_SLV_BNCH_CNT_ERRORS_0: integer := 8;
  constant N_SLV_BNCH_CNT_ERRORS_1: integer := 9;
  constant N_SLV_BNCH_CNT_ERRORS_2: integer := 10;
  constant N_SLV_BNCH_CNT_ERRORS_3: integer := 11;
  constant N_SLV_PHI_OFFSET_0: integer := 12;
  constant N_SLV_PHI_OFFSET_1: integer := 13;
  constant N_SLV_PHI_OFFSET_2: integer := 14;
  constant N_SLV_PHI_OFFSET_3: integer := 15;
  constant N_SLV_MUON_COUNTER_0: integer := 16;
  constant N_SLV_MUON_COUNTER_1: integer := 17;
  constant N_SLV_MUON_COUNTER_2: integer := 18;
  constant N_SLV_MUON_COUNTER_3: integer := 19;
  constant N_SLAVES: integer := 20;
-- END automatically generated VHDL

    
end ipbus_decode_mu_quad_deserialization;

package body ipbus_decode_mu_quad_deserialization is

  function ipbus_sel_mu_quad_deserialization(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Thu Sep 17 15:25:05 2015 
    if    std_match(addr, "----------------000-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SORT_RANK_MEM_0, IPBUS_SEL_WIDTH)); -- sort_rank_mem_0 / base 0x00000000 / mask 0x0000e000
    elsif std_match(addr, "----------------001-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SORT_RANK_MEM_1, IPBUS_SEL_WIDTH)); -- sort_rank_mem_1 / base 0x00002000 / mask 0x0000e000
    elsif std_match(addr, "----------------010-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SORT_RANK_MEM_2, IPBUS_SEL_WIDTH)); -- sort_rank_mem_2 / base 0x00004000 / mask 0x0000e000
    elsif std_match(addr, "----------------011-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SORT_RANK_MEM_3, IPBUS_SEL_WIDTH)); -- sort_rank_mem_3 / base 0x00006000 / mask 0x0000e000
    elsif std_match(addr, "----------------1000000000000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BC0_ERRORS_0, IPBUS_SEL_WIDTH)); -- bc0_errors_0 / base 0x00008000 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000000000001") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BC0_ERRORS_1, IPBUS_SEL_WIDTH)); -- bc0_errors_1 / base 0x00008001 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000000000010") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BC0_ERRORS_2, IPBUS_SEL_WIDTH)); -- bc0_errors_2 / base 0x00008002 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000000000100") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BC0_ERRORS_3, IPBUS_SEL_WIDTH)); -- bc0_errors_3 / base 0x00008004 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000000001000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BNCH_CNT_ERRORS_0, IPBUS_SEL_WIDTH)); -- bnch_cnt_errors_0 / base 0x00008008 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000000010000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BNCH_CNT_ERRORS_1, IPBUS_SEL_WIDTH)); -- bnch_cnt_errors_1 / base 0x00008010 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000000100000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BNCH_CNT_ERRORS_2, IPBUS_SEL_WIDTH)); -- bnch_cnt_errors_2 / base 0x00008020 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000001000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_BNCH_CNT_ERRORS_3, IPBUS_SEL_WIDTH)); -- bnch_cnt_errors_3 / base 0x00008040 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000010000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_OFFSET_0, IPBUS_SEL_WIDTH)); -- phi_offset_0 / base 0x00008080 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000000100000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_OFFSET_1, IPBUS_SEL_WIDTH)); -- phi_offset_1 / base 0x00008100 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000001000000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_OFFSET_2, IPBUS_SEL_WIDTH)); -- phi_offset_2 / base 0x00008200 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000010000000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_OFFSET_3, IPBUS_SEL_WIDTH)); -- phi_offset_3 / base 0x00008400 / mask 0x0000ffff
    elsif std_match(addr, "----------------1000100000000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_MUON_COUNTER_0, IPBUS_SEL_WIDTH)); -- muon_counter_0 / base 0x00008800 / mask 0x0000ffff
    elsif std_match(addr, "----------------1001000000000000") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_MUON_COUNTER_1, IPBUS_SEL_WIDTH)); -- muon_counter_1 / base 0x00009000 / mask 0x0000ffff
    elsif std_match(addr, "----------------1001000000000001") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_MUON_COUNTER_2, IPBUS_SEL_WIDTH)); -- muon_counter_2 / base 0x00009001 / mask 0x0000ffff
    elsif std_match(addr, "----------------1001000000000010") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_MUON_COUNTER_3, IPBUS_SEL_WIDTH)); -- muon_counter_3 / base 0x00009002 / mask 0x0000ffff
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_mu_quad_deserialization;

end ipbus_decode_mu_quad_deserialization;

