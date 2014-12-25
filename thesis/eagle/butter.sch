<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="butter">
<packages>
<package name="SOT-23-6">
<smd name="P$1" x="-1.1811" y="0.949959375" dx="1.4732" dy="0.4826" layer="1" rot="R180"/>
<smd name="P$2" x="-1.1811" y="0" dx="1.4732" dy="0.4826" layer="1" rot="R180"/>
<smd name="P$3" x="-1.1811" y="-0.949959375" dx="1.4732" dy="0.4826" layer="1" rot="R180"/>
<smd name="P$4" x="1.1811" y="-0.949959375" dx="1.4732" dy="0.4826" layer="1" rot="R180"/>
<smd name="P$5" x="1.1811" y="0" dx="1.4732" dy="0.4826" layer="1" rot="R180"/>
<smd name="P$6" x="1.1811" y="0.949959375" dx="1.4732" dy="0.4826" layer="1" rot="R180"/>
<wire x1="-0.8" y1="1.5" x2="-0.8" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-0.8" y1="-1.5" x2="0.8" y2="-1.5" width="0.127" layer="21"/>
<wire x1="0.8" y1="-1.5" x2="0.8" y2="1.5" width="0.127" layer="21"/>
<wire x1="0.8" y1="1.5" x2="-0.8" y2="1.5" width="0.127" layer="21"/>
<wire x1="-1" y1="1.4" x2="-1" y2="1.7" width="0.127" layer="21"/>
<wire x1="-1" y1="1.7" x2="-0.7" y2="1.7" width="0.127" layer="21"/>
<text x="-0.9" y="-2.5" size="0.8128" layer="25" font="vector">&gt;NAME</text>
</package>
<package name="TSSOP-16">
<smd name="P$1" x="-2.8" y="2.275" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$2" x="-2.8" y="1.625" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$3" x="-2.8" y="0.975" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$4" x="-2.8" y="0.325" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$5" x="-2.8" y="-0.325" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$6" x="-2.8" y="-0.975" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$7" x="-2.8" y="-1.625" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$8" x="-2.8" y="-2.275" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$9" x="2.8" y="-2.275" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$10" x="2.8" y="-1.625" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$11" x="2.8" y="-0.975" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$12" x="2.8" y="-0.325" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$13" x="2.8" y="0.325" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$14" x="2.8" y="0.975" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$15" x="2.8" y="1.625" dx="1.6" dy="0.35" layer="1"/>
<smd name="P$16" x="2.8" y="2.275" dx="1.6" dy="0.35" layer="1"/>
<wire x1="-2.2" y1="2.6" x2="-2.2" y2="-2.6" width="0.127" layer="21"/>
<wire x1="-2.2" y1="-2.6" x2="2.2" y2="-2.6" width="0.127" layer="21"/>
<wire x1="2.2" y1="-2.6" x2="2.2" y2="2.6" width="0.127" layer="21"/>
<wire x1="2.2" y1="2.6" x2="-2.2" y2="2.6" width="0.127" layer="21"/>
<wire x1="-2.2" y1="2.9" x2="-1.8" y2="2.9" width="0.127" layer="21"/>
<wire x1="-2.2" y1="2.9" x2="-2.2" y2="3" width="0.127" layer="21"/>
<wire x1="-2.2" y1="3" x2="-2" y2="3.2" width="0.127" layer="21"/>
<wire x1="-2" y1="3.2" x2="-1.8" y2="3" width="0.127" layer="21"/>
<wire x1="-1.8" y1="3" x2="-1.8" y2="2.9" width="0.127" layer="21"/>
<text x="-1.27" y="-3.81" size="1.016" layer="25" font="vector">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="ADC">
<wire x1="-12.7" y1="0" x2="-2.54" y2="7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="-2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-12.7" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="8.128" size="1.27" layer="95" font="vector">&gt;NAME</text>
<pin name="IN" x="-15.24" y="0" visible="pin" length="short"/>
<pin name="!CS" x="7.62" y="2.54" visible="pin" length="short" rot="R180"/>
<pin name="SDATA" x="7.62" y="0" visible="pin" length="short" rot="R180"/>
<pin name="SCLK" x="7.62" y="-2.54" visible="pin" length="short" rot="R180"/>
<pin name="GND" x="7.62" y="-5.08" visible="pin" length="short" rot="R180"/>
<pin name="VDD" x="7.62" y="5.08" visible="pin" length="short" rot="R180"/>
<text x="-2.54" y="-10.16" size="1.27" layer="96" font="vector">&gt;VALUE</text>
</symbol>
<symbol name="MULT">
<pin name="Y0" x="10.16" y="10.16" visible="pin" length="short" rot="R180"/>
<pin name="Y1" x="10.16" y="7.62" visible="pin" length="short" rot="R180"/>
<pin name="Y2" x="10.16" y="5.08" visible="pin" length="short" rot="R180"/>
<pin name="Y3" x="10.16" y="2.54" visible="pin" length="short" rot="R180"/>
<pin name="Y4" x="10.16" y="0" visible="pin" length="short" rot="R180"/>
<pin name="Y5" x="10.16" y="-2.54" visible="pin" length="short" rot="R180"/>
<pin name="Y6" x="10.16" y="-5.08" visible="pin" length="short" rot="R180"/>
<pin name="Y7" x="10.16" y="-7.62" visible="pin" length="short" rot="R180"/>
<pin name="S0" x="-10.16" y="10.16" visible="pin" length="short"/>
<pin name="S1" x="-10.16" y="7.62" visible="pin" length="short"/>
<pin name="S2" x="-10.16" y="5.08" visible="pin" length="short"/>
<pin name="Z" x="-10.16" y="2.54" visible="pin" length="short"/>
<pin name="VCC" x="-10.16" y="-2.54" visible="pin" length="short"/>
<pin name="GND" x="-10.16" y="-5.08" visible="pin" length="short"/>
<pin name="!E" x="-10.16" y="0" visible="pin" length="short"/>
<wire x1="-7.62" y1="12.7" x2="-7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="-10.16" x2="7.62" y2="12.7" width="0.254" layer="94"/>
<wire x1="7.62" y1="12.7" x2="-7.62" y2="12.7" width="0.254" layer="94"/>
<pin name="VEE" x="-10.16" y="-7.62" visible="pin" length="short"/>
<text x="-7.62" y="13.208" size="1.6764" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-12.7" size="1.6764" layer="96" font="vector">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ADCS7477" prefix="U">
<description>&lt;h4&gt;TI ADCS7477&lt;/h4&gt;
10 bit 1MSPS ADC
&lt;br&gt;
5V 10mW
&lt;br&gt;
&lt;a href="http://www.digikey.com/product-detail/en/ADCS7477AIMF%2FNOPB/ADCS7477AIMF%2FNOPBTR-ND/568478"&gt;Digikey&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="ADC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT-23-6">
<connects>
<connect gate="G$1" pin="!CS" pad="P$6"/>
<connect gate="G$1" pin="GND" pad="P$2"/>
<connect gate="G$1" pin="IN" pad="P$3"/>
<connect gate="G$1" pin="SCLK" pad="P$4"/>
<connect gate="G$1" pin="SDATA" pad="P$5"/>
<connect gate="G$1" pin="VDD" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CD4051BPWR" prefix="U">
<description>&lt;h4&gt;CD4051BPWR&lt;/h4&gt;

TI 8:1 Analog Multiplexer
&lt;br&gt;
&lt;a href="http://www.digikey.com/product-detail/en/CD4051BPWR/296-11993-1-ND/390442"&gt;Digikey&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="MULT" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TSSOP-16">
<connects>
<connect gate="G$1" pin="!E" pad="P$6"/>
<connect gate="G$1" pin="GND" pad="P$8"/>
<connect gate="G$1" pin="S0" pad="P$11"/>
<connect gate="G$1" pin="S1" pad="P$10"/>
<connect gate="G$1" pin="S2" pad="P$9"/>
<connect gate="G$1" pin="VCC" pad="P$16"/>
<connect gate="G$1" pin="VEE" pad="P$7"/>
<connect gate="G$1" pin="Y0" pad="P$13"/>
<connect gate="G$1" pin="Y1" pad="P$14"/>
<connect gate="G$1" pin="Y2" pad="P$15"/>
<connect gate="G$1" pin="Y3" pad="P$12"/>
<connect gate="G$1" pin="Y4" pad="P$1"/>
<connect gate="G$1" pin="Y5" pad="P$5"/>
<connect gate="G$1" pin="Y6" pad="P$2"/>
<connect gate="G$1" pin="Y7" pad="P$4"/>
<connect gate="G$1" pin="Z" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="VCC">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U1" library="butter" deviceset="ADCS7477" device=""/>
<part name="U2" library="butter" deviceset="ADCS7477" device=""/>
<part name="U3" library="butter" deviceset="ADCS7477" device=""/>
<part name="U4" library="butter" deviceset="ADCS7477" device=""/>
<part name="U5" library="butter" deviceset="ADCS7477" device=""/>
<part name="U6" library="butter" deviceset="ADCS7477" device=""/>
<part name="P+1" library="supply1" deviceset="VCC" device=""/>
<part name="P+2" library="supply1" deviceset="VCC" device=""/>
<part name="P+3" library="supply1" deviceset="VCC" device=""/>
<part name="P+4" library="supply1" deviceset="VCC" device=""/>
<part name="P+5" library="supply1" deviceset="VCC" device=""/>
<part name="P+6" library="supply1" deviceset="VCC" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="U7" library="butter" deviceset="ADCS7477" device=""/>
<part name="U8" library="butter" deviceset="ADCS7477" device=""/>
<part name="P+7" library="supply1" deviceset="VCC" device=""/>
<part name="P+8" library="supply1" deviceset="VCC" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="U9" library="butter" deviceset="CD4051BPWR" device=""/>
<part name="U10" library="butter" deviceset="CD4051BPWR" device=""/>
<part name="U11" library="butter" deviceset="CD4051BPWR" device=""/>
<part name="U12" library="butter" deviceset="CD4051BPWR" device=""/>
<part name="U13" library="butter" deviceset="CD4051BPWR" device=""/>
<part name="U14" library="butter" deviceset="CD4051BPWR" device=""/>
<part name="U15" library="butter" deviceset="CD4051BPWR" device=""/>
<part name="U16" library="butter" deviceset="CD4051BPWR" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U1" gate="G$1" x="33.02" y="50.8" rot="MR0"/>
<instance part="U2" gate="G$1" x="55.88" y="38.1" rot="MR0"/>
<instance part="U3" gate="G$1" x="33.02" y="25.4" rot="MR0"/>
<instance part="U4" gate="G$1" x="55.88" y="12.7" rot="MR0"/>
<instance part="U5" gate="G$1" x="33.02" y="0" rot="MR0"/>
<instance part="U6" gate="G$1" x="55.88" y="-12.7" rot="MR0"/>
<instance part="P+1" gate="VCC" x="48.26" y="20.32"/>
<instance part="P+2" gate="VCC" x="25.4" y="58.42"/>
<instance part="P+3" gate="VCC" x="48.26" y="45.72"/>
<instance part="P+4" gate="VCC" x="25.4" y="33.02"/>
<instance part="P+5" gate="VCC" x="25.4" y="7.62"/>
<instance part="P+6" gate="VCC" x="48.26" y="-5.08"/>
<instance part="GND1" gate="1" x="25.4" y="43.18"/>
<instance part="GND2" gate="1" x="48.26" y="30.48"/>
<instance part="GND3" gate="1" x="25.4" y="17.78"/>
<instance part="GND4" gate="1" x="48.26" y="-20.32"/>
<instance part="GND5" gate="1" x="25.4" y="-7.62"/>
<instance part="GND6" gate="1" x="48.26" y="5.08"/>
<instance part="U7" gate="G$1" x="33.02" y="-25.4" rot="MR0"/>
<instance part="U8" gate="G$1" x="55.88" y="-40.64" rot="MR0"/>
<instance part="P+7" gate="VCC" x="25.4" y="-17.78"/>
<instance part="P+8" gate="VCC" x="48.26" y="-33.02"/>
<instance part="GND7" gate="1" x="48.26" y="-48.26"/>
<instance part="GND8" gate="1" x="25.4" y="-33.02"/>
<instance part="U9" gate="G$1" x="101.6" y="76.2"/>
<instance part="U10" gate="G$1" x="101.6" y="48.26"/>
<instance part="U11" gate="G$1" x="101.6" y="20.32"/>
<instance part="U12" gate="G$1" x="101.6" y="-7.62"/>
<instance part="U13" gate="G$1" x="101.6" y="-35.56"/>
<instance part="U14" gate="G$1" x="101.6" y="-63.5"/>
<instance part="U15" gate="G$1" x="101.6" y="-91.44"/>
<instance part="U16" gate="G$1" x="101.6" y="-119.38"/>
</instances>
<busses>
</busses>
<nets>
<net name="VCC" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="VDD"/>
<pinref part="P+3" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VDD"/>
<pinref part="P+4" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="VDD"/>
<pinref part="P+5" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="VDD"/>
<pinref part="P+6" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="VDD"/>
<pinref part="P+2" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="VDD"/>
<pinref part="P+1" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="VDD"/>
<pinref part="P+7" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="VDD"/>
<pinref part="P+8" gate="VCC" pin="VCC"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GND"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="GND"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="GND"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="GND"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="GND"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="GND"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
</net>
<net name="SCK" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SCLK"/>
<wire x1="25.4" y1="48.26" x2="22.86" y2="48.26" width="0.1524" layer="91"/>
<label x="22.86" y="48.26" size="1.4224" layer="95" font="vector"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="SCLK"/>
<wire x1="48.26" y1="35.56" x2="45.72" y2="35.56" width="0.1524" layer="91"/>
<label x="45.72" y="35.56" size="1.4224" layer="95" font="vector"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="SCLK"/>
<wire x1="25.4" y1="22.86" x2="22.86" y2="22.86" width="0.1524" layer="91"/>
<label x="22.86" y="22.86" size="1.4224" layer="95" font="vector"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="SCLK"/>
<wire x1="48.26" y1="10.16" x2="45.72" y2="10.16" width="0.1524" layer="91"/>
<label x="45.72" y="10.16" size="1.4224" layer="95" font="vector"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="SCLK"/>
<wire x1="25.4" y1="-2.54" x2="22.86" y2="-2.54" width="0.1524" layer="91"/>
<label x="22.86" y="-2.54" size="1.4224" layer="95" font="vector"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="SCLK"/>
<wire x1="48.26" y1="-15.24" x2="45.72" y2="-15.24" width="0.1524" layer="91"/>
<label x="45.72" y="-15.24" size="1.4224" layer="95" font="vector"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="SCLK"/>
<wire x1="25.4" y1="-27.94" x2="22.86" y2="-27.94" width="0.1524" layer="91"/>
<label x="22.86" y="-27.94" size="1.4224" layer="95" font="vector"/>
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="SCLK"/>
<wire x1="48.26" y1="-43.18" x2="45.72" y2="-43.18" width="0.1524" layer="91"/>
<label x="45.72" y="-43.18" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="!CS6" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="!CS"/>
<wire x1="48.26" y1="-10.16" x2="45.72" y2="-10.16" width="0.1524" layer="91"/>
<label x="45.72" y="-10.16" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="!CS2" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="!CS"/>
<wire x1="48.26" y1="40.64" x2="45.72" y2="40.64" width="0.1524" layer="91"/>
<label x="45.72" y="40.64" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="!CS3" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="!CS"/>
<wire x1="25.4" y1="27.94" x2="22.86" y2="27.94" width="0.1524" layer="91"/>
<label x="22.86" y="27.94" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="!CS1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="!CS"/>
<wire x1="25.4" y1="53.34" x2="22.86" y2="53.34" width="0.1524" layer="91"/>
<label x="22.86" y="53.34" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="!CS4" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="!CS"/>
<wire x1="48.26" y1="15.24" x2="45.72" y2="15.24" width="0.1524" layer="91"/>
<label x="45.72" y="15.24" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="!CS5" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="!CS"/>
<wire x1="25.4" y1="2.54" x2="22.86" y2="2.54" width="0.1524" layer="91"/>
<label x="22.86" y="2.54" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="!CS7" class="0">
<segment>
<pinref part="U7" gate="G$1" pin="!CS"/>
<wire x1="25.4" y1="-22.86" x2="22.86" y2="-22.86" width="0.1524" layer="91"/>
<label x="22.86" y="-22.86" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="!CS8" class="0">
<segment>
<pinref part="U8" gate="G$1" pin="!CS"/>
<wire x1="48.26" y1="-38.1" x2="45.72" y2="-38.1" width="0.1524" layer="91"/>
<label x="45.72" y="-38.1" size="1.4224" layer="95" font="vector"/>
</segment>
</net>
<net name="D1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SDATA"/>
<wire x1="25.4" y1="50.8" x2="12.7" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D2" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="SDATA"/>
<wire x1="48.26" y1="38.1" x2="12.7" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D6" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="SDATA"/>
<wire x1="48.26" y1="-12.7" x2="12.7" y2="-12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D3" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="SDATA"/>
<wire x1="25.4" y1="25.4" x2="12.7" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D4" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="SDATA"/>
<wire x1="48.26" y1="12.7" x2="12.7" y2="12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D5" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="SDATA"/>
<wire x1="25.4" y1="0" x2="12.7" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D7" class="0">
<segment>
<pinref part="U7" gate="G$1" pin="SDATA"/>
<wire x1="25.4" y1="-25.4" x2="12.7" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D8" class="0">
<segment>
<pinref part="U8" gate="G$1" pin="SDATA"/>
<wire x1="48.26" y1="-40.64" x2="12.7" y2="-40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U9" gate="G$1" pin="Z"/>
<pinref part="U1" gate="G$1" pin="IN"/>
<wire x1="91.44" y1="78.74" x2="48.26" y2="78.74" width="0.1524" layer="91"/>
<wire x1="48.26" y1="78.74" x2="48.26" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U10" gate="G$1" pin="Z"/>
<pinref part="U2" gate="G$1" pin="IN"/>
<wire x1="91.44" y1="50.8" x2="71.12" y2="50.8" width="0.1524" layer="91"/>
<wire x1="71.12" y1="50.8" x2="71.12" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U11" gate="G$1" pin="Z"/>
<pinref part="U3" gate="G$1" pin="IN"/>
<wire x1="91.44" y1="22.86" x2="48.26" y2="22.86" width="0.1524" layer="91"/>
<wire x1="48.26" y1="22.86" x2="48.26" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U12" gate="G$1" pin="Z"/>
<pinref part="U4" gate="G$1" pin="IN"/>
<wire x1="91.44" y1="-5.08" x2="71.12" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-5.08" x2="71.12" y2="12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="IN"/>
<wire x1="48.26" y1="0" x2="68.58" y2="0" width="0.1524" layer="91"/>
<wire x1="68.58" y1="0" x2="68.58" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="68.58" y1="-7.62" x2="83.82" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="83.82" y1="-7.62" x2="83.82" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="U13" gate="G$1" pin="Z"/>
<wire x1="83.82" y1="-33.02" x2="91.44" y2="-33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="IN"/>
<wire x1="71.12" y1="-12.7" x2="81.28" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="81.28" y1="-12.7" x2="81.28" y2="-60.96" width="0.1524" layer="91"/>
<pinref part="U14" gate="G$1" pin="Z"/>
<wire x1="81.28" y1="-60.96" x2="91.44" y2="-60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U7" gate="G$1" pin="IN"/>
<wire x1="48.26" y1="-25.4" x2="78.74" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="78.74" y1="-25.4" x2="78.74" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="U15" gate="G$1" pin="Z"/>
<wire x1="78.74" y1="-88.9" x2="91.44" y2="-88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U8" gate="G$1" pin="IN"/>
<wire x1="71.12" y1="-40.64" x2="76.2" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="76.2" y1="-40.64" x2="76.2" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="U16" gate="G$1" pin="Z"/>
<wire x1="76.2" y1="-116.84" x2="91.44" y2="-116.84" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
