uGMTfirmware
============

Firmware for the CMS uGMT.

This repository contains the algorithm part of the CMS uGMT firmware. It has been written for the Imperial MP7, a Virtex-7 based AMC module.

This most probably isn't of use for anyone outside the CMS Level-1 Trigger.

## Instructions for setting up the build environment
This has been tested on SLC6, but no guarantees given for anything.

*NOTE:* If you're planning to introduce changes and contribute back to the project follow the instructions in CONTRIBUTING.md.

Full instructions on how to check out a CACTUS project and build it can be found at https://twiki.cern.ch/twiki/bin/view/CMS/MP7FirmwareNews. Replace `examples/mp7xe_690` with `ugmt` as project and possibly `trunk` with your preferred tag.

Once you followed the steps outlined in the Twiki above until `make project` it is currently still necessary to perform the following edits manually:

1. Replace the existing payload entry in `cactusupgrades/components/mp7_infra/addr_table/mp7xe_infra.xml` with `<node id="payload" module="file://mp7_payload.xml" address="0x80000000" fwinfo="endpoint"/>`
2. Replace the payload definition with the `ugmt_serdes.vhd` block definition

  ```
          payload: entity work.mp7_payload
                port map(
                        ctrs => ctrs,
                        clk => clk_ipb,
                        rst => rst_ipb,
                        ipb_in => ipb_in_payload,
                        ipb_out => ipb_out_payload,
                        clk_payload => clk_payload,
                        rst_payload => rst_payload,
                        clk_p => clk_p,
                        rst_loc => rst_loc,
                        clken_loc => clken_loc,
                        bc0 => payload_bc0,
                        d => payload_d,
                        q => payload_q
                );
  ```
  in the top block. You can find it in `cactusupgrades/boards/mp7/base_fw/mp7xe_690/firmware/hdl/mp7xe_690.vhd`

It is then possible to setup and build the uGMT firmware by issuing `make project` followed by `make bitfile` and `make package` as described in the Twiki.

## Instructions for running the testbenches

The complete test suite can be run by using the `setupAndRunAllTestPatterns.py` script in `projects/ugmt/firmware/testbench` (if checked out via SVN -- else see CONTRIBUTING.md) which runs all available testbenches on all available test patterns.

A more fine-grained possibiliy is to use `setupAndRunAll.sh`. This script takes as its argument the test pattern type to be used. Currently there are four such test pattern types available:
- `ttbar_small_sample` -- a sample of events from a ttbar generator
- `many_events` -- the uGMT's muons inputs are saturated with muons (i.e. full 108 muons per bx)
- `fwd_iso_scan` -- only forward muons and energy deposits with uniform energy for a given bunch crossing
- `iso_test` -- muons with uniform pT; energy deposits with uniform energy for a given bunch crossing

Individual testbenches can be setup and run with the following commands entered in the root testbench directory (i.e. `uGMT_algos/firmware/testbench`):

```
bash setupSim.sh [directoryOfTestbench, e.g. deserializer]
cd [directoryOfTestbench, e.g. deserializer]
runSim.sh
```

*Note:* Make sure the Modelsim executables (i.e. `vsim`, etc.) are in your path and usable to run the tests.
