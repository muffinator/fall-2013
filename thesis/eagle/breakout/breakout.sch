<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
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
<package name="RAIL">
<smd name="P$1" x="-8.763" y="0" dx="14.478" dy="1.778" layer="1"/>
<smd name="P$2" x="8.763" y="0" dx="14.478" dy="1.778" layer="1"/>
<text x="-19.685" y="-0.635" size="1.27" layer="25">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="RAILSEP">
<pin name="L" x="-7.62" y="0" visible="off" length="short"/>
<pin name="R" x="7.62" y="0" visible="off" length="short" rot="R180"/>
<wire x1="-5.08" y1="0.762" x2="-5.08" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-0.762" x2="-0.508" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-0.508" y1="-0.762" x2="-0.508" y2="0.762" width="0.254" layer="94"/>
<wire x1="-0.508" y1="0.762" x2="-5.08" y2="0.762" width="0.254" layer="94"/>
<wire x1="0.508" y1="0.762" x2="0.508" y2="-0.762" width="0.254" layer="94"/>
<wire x1="0.508" y1="-0.762" x2="5.08" y2="-0.762" width="0.254" layer="94"/>
<wire x1="5.08" y1="-0.762" x2="5.08" y2="0.762" width="0.254" layer="94"/>
<wire x1="5.08" y1="0.762" x2="0.508" y2="0.762" width="0.254" layer="94"/>
<text x="-4.826" y="-0.508" size="1.016" layer="95">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="RAILSEP">
<gates>
<gate name="G$1" symbol="RAILSEP" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RAIL">
<connects>
<connect gate="G$1" pin="L" pad="P$1"/>
<connect gate="G$1" pin="R" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X30">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="8.255" y1="1.27" x2="9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.27" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="1.27" x2="-13.335" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="1.27" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="0.635" x2="-12.7" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-0.635" x2="-13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="0.635" x2="-12.065" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="1.27" x2="-10.795" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="1.27" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-0.635" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-1.27" x2="-12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="-1.27" x2="-12.7" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="0.635" x2="-17.145" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="1.27" x2="-15.875" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="1.27" x2="-15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="0.635" x2="-15.24" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-0.635" x2="-15.875" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="-1.27" x2="-17.145" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="-1.27" x2="-17.78" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="1.27" x2="-15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-0.635" x2="-14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-1.27" x2="-14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-22.225" y1="1.27" x2="-20.955" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-20.955" y1="1.27" x2="-20.32" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="0.635" x2="-20.32" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="-0.635" x2="-20.955" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-20.32" y1="0.635" x2="-19.685" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="1.27" x2="-18.415" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-18.415" y1="1.27" x2="-17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="0.635" x2="-17.78" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-0.635" x2="-18.415" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-18.415" y1="-1.27" x2="-19.685" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="-1.27" x2="-20.32" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-25.4" y1="0.635" x2="-24.765" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-24.765" y1="1.27" x2="-23.495" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-23.495" y1="1.27" x2="-22.86" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-22.86" y1="0.635" x2="-22.86" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-22.86" y1="-0.635" x2="-23.495" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-23.495" y1="-1.27" x2="-24.765" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-24.765" y1="-1.27" x2="-25.4" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-22.225" y1="1.27" x2="-22.86" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-22.86" y1="-0.635" x2="-22.225" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-20.955" y1="-1.27" x2="-22.225" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-29.845" y1="1.27" x2="-28.575" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="1.27" x2="-27.94" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-27.94" y1="0.635" x2="-27.94" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-27.94" y1="-0.635" x2="-28.575" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-27.94" y1="0.635" x2="-27.305" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-27.305" y1="1.27" x2="-26.035" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-26.035" y1="1.27" x2="-25.4" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-25.4" y1="0.635" x2="-25.4" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-25.4" y1="-0.635" x2="-26.035" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-26.035" y1="-1.27" x2="-27.305" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-27.305" y1="-1.27" x2="-27.94" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-33.02" y1="0.635" x2="-32.385" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-32.385" y1="1.27" x2="-31.115" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-31.115" y1="1.27" x2="-30.48" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-30.48" y1="0.635" x2="-30.48" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-30.48" y1="-0.635" x2="-31.115" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-31.115" y1="-1.27" x2="-32.385" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-32.385" y1="-1.27" x2="-33.02" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-29.845" y1="1.27" x2="-30.48" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-30.48" y1="-0.635" x2="-29.845" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="-1.27" x2="-29.845" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-37.465" y1="1.27" x2="-36.195" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-36.195" y1="1.27" x2="-35.56" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-35.56" y1="0.635" x2="-35.56" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-35.56" y1="-0.635" x2="-36.195" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-35.56" y1="0.635" x2="-34.925" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-34.925" y1="1.27" x2="-33.655" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-33.655" y1="1.27" x2="-33.02" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-33.02" y1="0.635" x2="-33.02" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-33.02" y1="-0.635" x2="-33.655" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-33.655" y1="-1.27" x2="-34.925" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-34.925" y1="-1.27" x2="-35.56" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-38.1" y1="0.635" x2="-38.1" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-37.465" y1="1.27" x2="-38.1" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-38.1" y1="-0.635" x2="-37.465" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-36.195" y1="-1.27" x2="-37.465" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="12.065" y2="1.27" width="0.1524" layer="21"/>
<wire x1="12.065" y1="1.27" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-0.635" x2="12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-1.27" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="13.335" y1="1.27" x2="14.605" y2="1.27" width="0.1524" layer="21"/>
<wire x1="14.605" y1="1.27" x2="15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="15.24" y1="0.635" x2="15.24" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-0.635" x2="14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="12.7" y1="0.635" x2="12.7" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="13.335" y1="1.27" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-0.635" x2="13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="14.605" y1="-1.27" x2="13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="15.875" y1="1.27" x2="17.145" y2="1.27" width="0.1524" layer="21"/>
<wire x1="17.145" y1="1.27" x2="17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-0.635" x2="17.145" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="15.875" y1="1.27" x2="15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-0.635" x2="15.875" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="17.145" y1="-1.27" x2="15.875" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="18.415" y1="1.27" x2="19.685" y2="1.27" width="0.1524" layer="21"/>
<wire x1="19.685" y1="1.27" x2="20.32" y2="0.635" width="0.1524" layer="21"/>
<wire x1="20.32" y1="0.635" x2="20.32" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-0.635" x2="19.685" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="17.78" y1="0.635" x2="17.78" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="18.415" y1="1.27" x2="17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-0.635" x2="18.415" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="19.685" y1="-1.27" x2="18.415" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="20.955" y1="1.27" x2="22.225" y2="1.27" width="0.1524" layer="21"/>
<wire x1="22.225" y1="1.27" x2="22.86" y2="0.635" width="0.1524" layer="21"/>
<wire x1="22.86" y1="-0.635" x2="22.225" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="20.955" y1="1.27" x2="20.32" y2="0.635" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-0.635" x2="20.955" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="22.225" y1="-1.27" x2="20.955" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="22.86" y1="0.635" x2="22.86" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="23.495" y1="1.27" x2="24.765" y2="1.27" width="0.1524" layer="21"/>
<wire x1="24.765" y1="1.27" x2="25.4" y2="0.635" width="0.1524" layer="21"/>
<wire x1="25.4" y1="-0.635" x2="24.765" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="23.495" y1="1.27" x2="22.86" y2="0.635" width="0.1524" layer="21"/>
<wire x1="22.86" y1="-0.635" x2="23.495" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="24.765" y1="-1.27" x2="23.495" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="26.035" y1="1.27" x2="27.305" y2="1.27" width="0.1524" layer="21"/>
<wire x1="27.305" y1="1.27" x2="27.94" y2="0.635" width="0.1524" layer="21"/>
<wire x1="27.94" y1="0.635" x2="27.94" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="27.94" y1="-0.635" x2="27.305" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="25.4" y1="0.635" x2="25.4" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="26.035" y1="1.27" x2="25.4" y2="0.635" width="0.1524" layer="21"/>
<wire x1="25.4" y1="-0.635" x2="26.035" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="27.305" y1="-1.27" x2="26.035" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="28.575" y1="1.27" x2="29.845" y2="1.27" width="0.1524" layer="21"/>
<wire x1="29.845" y1="1.27" x2="30.48" y2="0.635" width="0.1524" layer="21"/>
<wire x1="30.48" y1="-0.635" x2="29.845" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="28.575" y1="1.27" x2="27.94" y2="0.635" width="0.1524" layer="21"/>
<wire x1="27.94" y1="-0.635" x2="28.575" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="29.845" y1="-1.27" x2="28.575" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="31.115" y1="1.27" x2="32.385" y2="1.27" width="0.1524" layer="21"/>
<wire x1="32.385" y1="1.27" x2="33.02" y2="0.635" width="0.1524" layer="21"/>
<wire x1="33.02" y1="0.635" x2="33.02" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="33.02" y1="-0.635" x2="32.385" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="30.48" y1="0.635" x2="30.48" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="31.115" y1="1.27" x2="30.48" y2="0.635" width="0.1524" layer="21"/>
<wire x1="30.48" y1="-0.635" x2="31.115" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="32.385" y1="-1.27" x2="31.115" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="33.655" y1="1.27" x2="34.925" y2="1.27" width="0.1524" layer="21"/>
<wire x1="34.925" y1="1.27" x2="35.56" y2="0.635" width="0.1524" layer="21"/>
<wire x1="35.56" y1="-0.635" x2="34.925" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="33.655" y1="1.27" x2="33.02" y2="0.635" width="0.1524" layer="21"/>
<wire x1="33.02" y1="-0.635" x2="33.655" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="34.925" y1="-1.27" x2="33.655" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="35.56" y1="0.635" x2="35.56" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="36.195" y1="1.27" x2="37.465" y2="1.27" width="0.1524" layer="21"/>
<wire x1="37.465" y1="1.27" x2="38.1" y2="0.635" width="0.1524" layer="21"/>
<wire x1="38.1" y1="0.635" x2="38.1" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="38.1" y1="-0.635" x2="37.465" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="36.195" y1="1.27" x2="35.56" y2="0.635" width="0.1524" layer="21"/>
<wire x1="35.56" y1="-0.635" x2="36.195" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="37.465" y1="-1.27" x2="36.195" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-36.83" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-34.29" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-31.75" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-29.21" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="-26.67" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="-24.13" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="-21.59" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="-19.05" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="-16.51" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="10" x="-13.97" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="11" x="-11.43" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="12" x="-8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="13" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="15" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="16" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="17" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="18" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="19" x="8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="20" x="11.43" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="21" x="13.97" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="22" x="16.51" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="23" x="19.05" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="24" x="21.59" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="25" x="24.13" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="26" x="26.67" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="27" x="29.21" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="28" x="31.75" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="29" x="34.29" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="30" x="36.83" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-38.1762" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-38.1" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="8.636" y1="-0.254" x2="9.144" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="-9.144" y1="-0.254" x2="-8.636" y2="0.254" layer="51"/>
<rectangle x1="-11.684" y1="-0.254" x2="-11.176" y2="0.254" layer="51"/>
<rectangle x1="-14.224" y1="-0.254" x2="-13.716" y2="0.254" layer="51"/>
<rectangle x1="-16.764" y1="-0.254" x2="-16.256" y2="0.254" layer="51"/>
<rectangle x1="-19.304" y1="-0.254" x2="-18.796" y2="0.254" layer="51"/>
<rectangle x1="-21.844" y1="-0.254" x2="-21.336" y2="0.254" layer="51"/>
<rectangle x1="-24.384" y1="-0.254" x2="-23.876" y2="0.254" layer="51"/>
<rectangle x1="-26.924" y1="-0.254" x2="-26.416" y2="0.254" layer="51"/>
<rectangle x1="-29.464" y1="-0.254" x2="-28.956" y2="0.254" layer="51"/>
<rectangle x1="-32.004" y1="-0.254" x2="-31.496" y2="0.254" layer="51"/>
<rectangle x1="-34.544" y1="-0.254" x2="-34.036" y2="0.254" layer="51"/>
<rectangle x1="-37.084" y1="-0.254" x2="-36.576" y2="0.254" layer="51"/>
<rectangle x1="11.176" y1="-0.254" x2="11.684" y2="0.254" layer="51"/>
<rectangle x1="13.716" y1="-0.254" x2="14.224" y2="0.254" layer="51"/>
<rectangle x1="16.256" y1="-0.254" x2="16.764" y2="0.254" layer="51"/>
<rectangle x1="18.796" y1="-0.254" x2="19.304" y2="0.254" layer="51"/>
<rectangle x1="21.336" y1="-0.254" x2="21.844" y2="0.254" layer="51"/>
<rectangle x1="23.876" y1="-0.254" x2="24.384" y2="0.254" layer="51"/>
<rectangle x1="26.416" y1="-0.254" x2="26.924" y2="0.254" layer="51"/>
<rectangle x1="28.956" y1="-0.254" x2="29.464" y2="0.254" layer="51"/>
<rectangle x1="31.496" y1="-0.254" x2="32.004" y2="0.254" layer="51"/>
<rectangle x1="34.036" y1="-0.254" x2="34.544" y2="0.254" layer="51"/>
<rectangle x1="36.576" y1="-0.254" x2="37.084" y2="0.254" layer="51"/>
</package>
<package name="1X02">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="1X02/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINHD30">
<wire x1="-6.35" y1="-40.64" x2="1.27" y2="-40.64" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-40.64" x2="1.27" y2="38.1" width="0.4064" layer="94"/>
<wire x1="1.27" y1="38.1" x2="-6.35" y2="38.1" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="38.1" x2="-6.35" y2="-40.64" width="0.4064" layer="94"/>
<text x="-6.35" y="38.735" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-43.18" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="35.56" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="33.02" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="30.48" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="27.94" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="25.4" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="22.86" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="20.32" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="17.78" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="9" x="-2.54" y="15.24" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="-2.54" y="12.7" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="11" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="12" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="13" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="14" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="15" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="16" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="17" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="18" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="19" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="20" x="-2.54" y="-12.7" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="21" x="-2.54" y="-15.24" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="22" x="-2.54" y="-17.78" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="23" x="-2.54" y="-20.32" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="24" x="-2.54" y="-22.86" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="25" x="-2.54" y="-25.4" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="26" x="-2.54" y="-27.94" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="27" x="-2.54" y="-30.48" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="28" x="-2.54" y="-33.02" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="29" x="-2.54" y="-35.56" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="30" x="-2.54" y="-38.1" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD2">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X30" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD30" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X30">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="17" pad="17"/>
<connect gate="A" pin="18" pad="18"/>
<connect gate="A" pin="19" pad="19"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="20" pad="20"/>
<connect gate="A" pin="21" pad="21"/>
<connect gate="A" pin="22" pad="22"/>
<connect gate="A" pin="23" pad="23"/>
<connect gate="A" pin="24" pad="24"/>
<connect gate="A" pin="25" pad="25"/>
<connect gate="A" pin="26" pad="26"/>
<connect gate="A" pin="27" pad="27"/>
<connect gate="A" pin="28" pad="28"/>
<connect gate="A" pin="29" pad="29"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="30" pad="30"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X2" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X02/90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
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
<part name="U$1" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$2" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$3" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$4" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$5" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$6" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$7" library="butter" deviceset="RAILSEP" device=""/>
<part name="JP1" library="pinhead" deviceset="PINHD-1X30" device=""/>
<part name="U$8" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$9" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$10" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$11" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$12" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$13" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$14" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$15" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$16" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$17" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$18" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$19" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$20" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$21" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$22" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$23" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$24" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$25" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$26" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$27" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$28" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$29" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$30" library="butter" deviceset="RAILSEP" device=""/>
<part name="JP2" library="pinhead" deviceset="PINHD-1X30" device=""/>
<part name="U$31" library="butter" deviceset="RAILSEP" device=""/>
<part name="U$32" library="butter" deviceset="RAILSEP" device=""/>
<part name="JP3" library="pinhead" deviceset="PINHD-1X2" device=""/>
<part name="JP4" library="pinhead" deviceset="PINHD-1X2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="22.86" y="99.06"/>
<instance part="U$2" gate="G$1" x="22.86" y="96.52"/>
<instance part="U$3" gate="G$1" x="22.86" y="93.98"/>
<instance part="U$4" gate="G$1" x="22.86" y="91.44"/>
<instance part="U$5" gate="G$1" x="22.86" y="88.9"/>
<instance part="U$6" gate="G$1" x="22.86" y="86.36"/>
<instance part="U$7" gate="G$1" x="22.86" y="83.82"/>
<instance part="JP1" gate="A" x="5.08" y="60.96" rot="R180"/>
<instance part="U$8" gate="G$1" x="22.86" y="81.28"/>
<instance part="U$9" gate="G$1" x="22.86" y="78.74"/>
<instance part="U$10" gate="G$1" x="22.86" y="76.2"/>
<instance part="U$11" gate="G$1" x="22.86" y="73.66"/>
<instance part="U$12" gate="G$1" x="22.86" y="71.12"/>
<instance part="U$13" gate="G$1" x="22.86" y="68.58"/>
<instance part="U$14" gate="G$1" x="22.86" y="66.04"/>
<instance part="U$15" gate="G$1" x="22.86" y="63.5"/>
<instance part="U$16" gate="G$1" x="22.86" y="60.96"/>
<instance part="U$17" gate="G$1" x="22.86" y="58.42"/>
<instance part="U$18" gate="G$1" x="22.86" y="55.88"/>
<instance part="U$19" gate="G$1" x="22.86" y="53.34"/>
<instance part="U$20" gate="G$1" x="22.86" y="50.8"/>
<instance part="U$21" gate="G$1" x="22.86" y="48.26"/>
<instance part="U$22" gate="G$1" x="22.86" y="45.72"/>
<instance part="U$23" gate="G$1" x="22.86" y="43.18"/>
<instance part="U$24" gate="G$1" x="22.86" y="40.64"/>
<instance part="U$25" gate="G$1" x="22.86" y="38.1"/>
<instance part="U$26" gate="G$1" x="22.86" y="35.56"/>
<instance part="U$27" gate="G$1" x="22.86" y="33.02"/>
<instance part="U$28" gate="G$1" x="22.86" y="30.48"/>
<instance part="U$29" gate="G$1" x="22.86" y="27.94"/>
<instance part="U$30" gate="G$1" x="22.86" y="25.4"/>
<instance part="JP2" gate="A" x="40.64" y="63.5"/>
<instance part="U$31" gate="G$1" x="22.86" y="22.86"/>
<instance part="U$32" gate="G$1" x="22.86" y="20.32"/>
<instance part="JP3" gate="G$1" x="5.08" y="22.86" rot="R180"/>
<instance part="JP4" gate="G$1" x="40.64" y="20.32"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="30"/>
<wire x1="7.62" y1="99.06" x2="15.24" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="29"/>
<wire x1="7.62" y1="96.52" x2="15.24" y2="96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$3" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="28"/>
<wire x1="7.62" y1="93.98" x2="15.24" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U$4" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="27"/>
<wire x1="7.62" y1="91.44" x2="15.24" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U$5" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="26"/>
<wire x1="7.62" y1="88.9" x2="15.24" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U$6" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="25"/>
<wire x1="7.62" y1="86.36" x2="15.24" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U$7" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="24"/>
<wire x1="7.62" y1="83.82" x2="15.24" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="JP1" gate="A" pin="23"/>
<pinref part="U$8" gate="G$1" pin="L"/>
<wire x1="7.62" y1="81.28" x2="15.24" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="JP1" gate="A" pin="22"/>
<pinref part="U$9" gate="G$1" pin="L"/>
<wire x1="7.62" y1="78.74" x2="15.24" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="JP1" gate="A" pin="21"/>
<pinref part="U$10" gate="G$1" pin="L"/>
<wire x1="7.62" y1="76.2" x2="15.24" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="JP1" gate="A" pin="1"/>
<pinref part="U$30" gate="G$1" pin="L"/>
<wire x1="7.62" y1="25.4" x2="15.24" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="U$11" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="20"/>
<wire x1="7.62" y1="73.66" x2="15.24" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="U$12" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="19"/>
<wire x1="7.62" y1="71.12" x2="15.24" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="U$13" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="18"/>
<wire x1="7.62" y1="68.58" x2="15.24" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="U$14" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="17"/>
<wire x1="7.62" y1="66.04" x2="15.24" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="U$15" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="16"/>
<wire x1="7.62" y1="63.5" x2="15.24" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U$16" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="15"/>
<wire x1="7.62" y1="60.96" x2="15.24" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="U$17" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="14"/>
<wire x1="7.62" y1="58.42" x2="15.24" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="U$18" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="13"/>
<wire x1="7.62" y1="55.88" x2="15.24" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="U$19" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="12"/>
<wire x1="7.62" y1="53.34" x2="15.24" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="U$20" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="11"/>
<wire x1="7.62" y1="50.8" x2="15.24" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="U$21" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="10"/>
<wire x1="7.62" y1="48.26" x2="15.24" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="U$22" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="9"/>
<wire x1="7.62" y1="45.72" x2="15.24" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="U$23" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="8"/>
<wire x1="7.62" y1="43.18" x2="15.24" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="U$24" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="7"/>
<wire x1="7.62" y1="40.64" x2="15.24" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="U$25" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="6"/>
<wire x1="7.62" y1="38.1" x2="15.24" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="U$26" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="5"/>
<wire x1="7.62" y1="35.56" x2="15.24" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="U$27" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="7.62" y1="33.02" x2="15.24" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="U$28" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="3"/>
<wire x1="7.62" y1="30.48" x2="15.24" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="U$29" gate="G$1" pin="L"/>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="7.62" y1="27.94" x2="15.24" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="38.1" y1="99.06" x2="30.48" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="38.1" y1="96.52" x2="30.48" y2="96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="U$3" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="3"/>
<wire x1="38.1" y1="93.98" x2="30.48" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="U$4" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="38.1" y1="91.44" x2="30.48" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="U$5" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="5"/>
<wire x1="38.1" y1="88.9" x2="30.48" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="U$6" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="6"/>
<wire x1="38.1" y1="86.36" x2="30.48" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="U$7" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="7"/>
<wire x1="38.1" y1="83.82" x2="30.48" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="U$8" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="8"/>
<wire x1="38.1" y1="81.28" x2="30.48" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="U$9" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="9"/>
<wire x1="38.1" y1="78.74" x2="30.48" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="U$10" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="10"/>
<wire x1="38.1" y1="76.2" x2="30.48" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="U$11" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="11"/>
<wire x1="38.1" y1="73.66" x2="30.48" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<pinref part="U$12" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="12"/>
<wire x1="38.1" y1="71.12" x2="30.48" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="U$13" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="13"/>
<wire x1="38.1" y1="68.58" x2="30.48" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="U$14" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="14"/>
<wire x1="38.1" y1="66.04" x2="30.48" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<pinref part="U$15" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="15"/>
<wire x1="38.1" y1="63.5" x2="30.48" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<pinref part="U$16" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="16"/>
<wire x1="38.1" y1="60.96" x2="30.48" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<pinref part="U$17" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="17"/>
<wire x1="38.1" y1="58.42" x2="30.48" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="U$18" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="18"/>
<wire x1="38.1" y1="55.88" x2="30.48" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="U$19" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="19"/>
<wire x1="38.1" y1="53.34" x2="30.48" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="U$20" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="20"/>
<wire x1="38.1" y1="50.8" x2="30.48" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<pinref part="U$21" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="21"/>
<wire x1="38.1" y1="48.26" x2="30.48" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="U$22" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="22"/>
<wire x1="38.1" y1="45.72" x2="30.48" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="U$23" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="23"/>
<wire x1="38.1" y1="43.18" x2="30.48" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$54" class="0">
<segment>
<pinref part="U$24" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="24"/>
<wire x1="38.1" y1="40.64" x2="30.48" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$55" class="0">
<segment>
<pinref part="U$25" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="25"/>
<wire x1="38.1" y1="38.1" x2="30.48" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$56" class="0">
<segment>
<pinref part="U$26" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="26"/>
<wire x1="38.1" y1="35.56" x2="30.48" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$57" class="0">
<segment>
<pinref part="U$27" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="27"/>
<wire x1="38.1" y1="33.02" x2="30.48" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$58" class="0">
<segment>
<pinref part="U$28" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="28"/>
<wire x1="38.1" y1="30.48" x2="30.48" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$59" class="0">
<segment>
<pinref part="U$29" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="29"/>
<wire x1="38.1" y1="27.94" x2="30.48" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$60" class="0">
<segment>
<pinref part="U$30" gate="G$1" pin="R"/>
<pinref part="JP2" gate="A" pin="30"/>
<wire x1="38.1" y1="25.4" x2="30.48" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$61" class="0">
<segment>
<pinref part="U$31" gate="G$1" pin="L"/>
<pinref part="JP3" gate="G$1" pin="2"/>
<wire x1="7.62" y1="22.86" x2="15.24" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$62" class="0">
<segment>
<pinref part="U$32" gate="G$1" pin="L"/>
<pinref part="JP3" gate="G$1" pin="1"/>
<wire x1="7.62" y1="20.32" x2="15.24" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$63" class="0">
<segment>
<pinref part="U$31" gate="G$1" pin="R"/>
<pinref part="JP4" gate="G$1" pin="1"/>
<wire x1="38.1" y1="22.86" x2="30.48" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$64" class="0">
<segment>
<pinref part="U$32" gate="G$1" pin="R"/>
<pinref part="JP4" gate="G$1" pin="2"/>
<wire x1="38.1" y1="20.32" x2="30.48" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
