//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

package fqwb_090426_omnetpp.simulations.cars;

import org.car2x.veins.subprojects.veins_inet.VeinsInetManager;
import inet.physicallayer*.wireless.ieee80211.packetlevel.Ieee80211DimensionalRadioMedium;
import org.car2x.veins.subprojects.veins_inet.VeinsInetCar;
import org.car2x.veins.subprojects.veins_inet.VeinsInetManager;
import inet.visualizer*.common.IntegratedVisualizer;
import inet.environment.common.PhysicalEnvironment;
import org.car2x.veins.visualizer.roads.RoadsCanvasVisualizer;
import org.car2x.veins.visualizer.roads.RoadsOsgVisualizer;

import simu5g.world.radio.LteChannelControl;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.PgwStandard;
import simu5g.common.binder.Binder;
import simu5g.nodes.eNodeB;
import simu5g.nodes.LteUe;
import simu5g.nodes.LteCar;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.inet.AdhocHost;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.node.ethernet.Eth100G;

network Cars
{
    parameters:
        @display("bgb=500000,500000");
    submodules:
        routingRecorder: RoutingTableRecorder {
            @display("p=327739,92941;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=314898,52585");
        }

        veinsManager: VeinsInetManager {
            @display("p=462870,15898;is=s");
        }
        visualizer: IntegratedVisualizer {
            @display("p=462259,52585");
        }
        roadsCanvasVisualizer: RoadsCanvasVisualizer {
            @display("p=390719,52585");
        }

        channelControl: LteChannelControl {
            @display("p=314287,15898;is=s");
        }
        binder: Binder {
            @display("p=390719,93552;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=390719,15898;is=s");
        }
        server: StandardHost {
            @display("p=251919,16509;is=n;i=device/server");
        }
        speedtest: StandardHost {
            @display("p=251877,22599;is=n;i=device/server");
        }
        router: Router {
            @display("p=191385,19567;i=device/smallrouter");
        }
        pgw: PgwStandard {
            @display("p=144914,29961;is=l");
        }

        eNodeB0: eNodeB {
            @display("p=1708.51,4984.68");
        }
        eNodeB1: eNodeB {
            @display("p=6036.46,6858.13");
        }
        eNodeB2: eNodeB {
            @display("p=8917.64,10347.93");
        }
        eNodeB3: eNodeB {
            @display("p=11678.01,14272.38");
        }
        eNodeB4: eNodeB {
            @display("p=14471.4,18175.95");
        }
        eNodeB5: eNodeB {
            @display("p=15388.38,22701.23");
        }
        eNodeB6: eNodeB {
            @display("p=15384.12,27428.42");
        }
        eNodeB7: eNodeB {
            @display("p=18519.63,30894.83");
        }
        eNodeB8: eNodeB {
            @display("p=20893.6,35031.37");
        }
        eNodeB9: eNodeB {
            @display("p=23736.06,38876.09");
        }
        eNodeB10: eNodeB {
            @display("p=27403.24,41959.19");
        }
        eNodeB11: eNodeB {
            @display("p=31092.23,44995.55");
        }
        eNodeB12: eNodeB {
            @display("p=31969.32,49623.22");
        }
        eNodeB13: eNodeB {
            @display("p=33727.39,53993.35");
        }
        eNodeB14: eNodeB {
            @display("p=36033.84,58203.4");
        }
        eNodeB15: eNodeB {
            @display("p=38329.72,62420.28");
        }
        eNodeB16: eNodeB {
            @display("p=39872.95,66994.79");
        }
        eNodeB17: eNodeB {
            @display("p=42623.58,70898.47");
        }
        eNodeB18: eNodeB {
            @display("p=44286.32,75401.8");
        }
        eNodeB19: eNodeB {
            @display("p=45506.66,80046.06");
        }
        eNodeB20: eNodeB {
            @display("p=47972.3,84155.66");
        }
        eNodeB21: eNodeB {
            @display("p=48407.41,88850.26");
        }
        eNodeB22: eNodeB {
            @display("p=47647.31,93591.61");
        }
        eNodeB23: eNodeB {
            @display("p=46517.22,98259.01");
        }
        eNodeB24: eNodeB {
            @display("p=45600.44,102937.34");
        }
        eNodeB25: eNodeB {
            @display("p=46628.76,107598.27");
        }
        eNodeB26: eNodeB {
            @display("p=48055.07,112180.84");
        }
        eNodeB27: eNodeB {
            @display("p=49552.8,116741.9");
        }
        eNodeB28: eNodeB {
            @display("p=50963.4,121349.99");
        }
        eNodeB29: eNodeB {
            @display("p=52910.04,125692.58");
        }
        eNodeB30: eNodeB {
            @display("p=56077.37,129290.56");
        }
        eNodeB31: eNodeB {
            @display("p=60159.82,131705.85");
        }
        eNodeB32: eNodeB {
            @display("p=64728.45,133156.52");
        }
        eNodeB33: eNodeB {
            @display("p=69312.73,134630.66");
        }
        eNodeB34: eNodeB {
            @display("p=73879.46,136104.2");
        }
        eNodeB35: eNodeB {
            @display("p=78404.98,137698.31");
        }
        eNodeB36: eNodeB {
            @display("p=82826.15,139549.09");
        }
        eNodeB37: eNodeB {
            @display("p=87216.34,141460.93");
        }
        eNodeB38: eNodeB {
            @display("p=91606.56,143395.17");
        }
        eNodeB39: eNodeB {
            @display("p=95887.71,145509.25");
        }
        eNodeB40: eNodeB {
            @display("p=99852.33,148127.38");
        }
        eNodeB41: eNodeB {
            @display("p=104360.36,149776.52");
        }
        eNodeB42: eNodeB {
            @display("p=108567.75,152066.63");
        }
        eNodeB43: eNodeB {
            @display("p=112448.8,154864.63");
        }
        eNodeB44: eNodeB {
            @display("p=116668.95,157150.0");
        }
        eNodeB45: eNodeB {
            @display("p=120463.67,159911.3");
        }
        eNodeB46: eNodeB {
            @display("p=123490.15,163568.14");
        }
        eNodeB47: eNodeB {
            @display("p=127247.14,166464.96");
        }
        eNodeB48: eNodeB {
            @display("p=130645.48,169852.77");
        }
        eNodeB49: eNodeB {
            @display("p=133582.55,173648.83");
        }
        eNodeB50: eNodeB {
            @display("p=136755.66,177175.76");
        }
        eNodeB51: eNodeB {
            @display("p=140186.09,180095.31");
        }
        eNodeB52: eNodeB {
            @display("p=144931.36,180734.77");
        }
        eNodeB53: eNodeB {
            @display("p=149529.82,179596.18");
        }
        eNodeB54: eNodeB {
            @display("p=154096.3,181164.21");
        }
        eNodeB55: eNodeB {
            @display("p=157162.6,184812.28");
        }
        eNodeB56: eNodeB {
            @display("p=158386.18,189405.78");
        }
        eNodeB57: eNodeB {
            @display("p=159249.19,194088.55");
        }
        eNodeB58: eNodeB {
            @display("p=161543.32,198227.73");
        }
        eNodeB59: eNodeB {
            @display("p=164284.18,202024.26");
        }
        eNodeB60: eNodeB {
            @display("p=167929.19,205150.23");
        }
        eNodeB61: eNodeB {
            @display("p=170630.61,209104.5");
        }
        eNodeB62: eNodeB {
            @display("p=172251.97,213620.01");
        }
        eNodeB63: eNodeB {
            @display("p=174686.96,217737.85");
        }
        eNodeB64: eNodeB {
            @display("p=177471.15,221649.48");
        }
        eNodeB65: eNodeB {
            @display("p=180181.5,225605.0");
        }
        eNodeB66: eNodeB {
            @display("p=184001.06,228443.62");
        }
        eNodeB67: eNodeB {
            @display("p=187279.72,231905.09");
        }
        eNodeB68: eNodeB {
            @display("p=188728.0,236466.31");
        }
        eNodeB69: eNodeB {
            @display("p=189679.45,241172.02");
        }
        eNodeB70: eNodeB {
            @display("p=191067.22,245725.75");
        }
        eNodeB71: eNodeB {
            @display("p=194429.76,249069.45");
        }
        eNodeB72: eNodeB {
            @display("p=197796.93,252471.62");
        }
        eNodeB73: eNodeB {
            @display("p=199924.45,256790.79");
        }
        eNodeB74: eNodeB {
            @display("p=200999.05,261419.15");
        }
        eNodeB75: eNodeB {
            @display("p=201473.38,266181.96");
        }
        eNodeB76: eNodeB {
            @display("p=202016.69,270948.94");
        }
        eNodeB77: eNodeB {
            @display("p=202579.6,275713.57");
        }
        eNodeB78: eNodeB {
            @display("p=204467.38,280063.28");
        }
        eNodeB79: eNodeB {
            @display("p=208071.45,283183.77");
        }
        eNodeB80: eNodeB {
            @display("p=211964.5,285995.67");
        }
        eNodeB81: eNodeB {
            @display("p=215727.81,288999.65");
        }
        eNodeB82: eNodeB {
            @display("p=218647.83,292793.9");
        }
        eNodeB83: eNodeB {
            @display("p=223062.31,294482.38");
        }
        eNodeB84: eNodeB {
            @display("p=227023.69,297105.44");
        }
        eNodeB85: eNodeB {
            @display("p=229804.44,300989.23");
        }
        eNodeB86: eNodeB {
            @display("p=232318.77,304939.52");
        }
        eNodeB87: eNodeB {
            @display("p=236443.69,307224.04");
        }
        eNodeB88: eNodeB {
            @display("p=238947.09,311278.25");
        }
        eNodeB89: eNodeB {
            @display("p=241921.3,314898.67");
        }
        eNodeB90: eNodeB {
            @display("p=243207.6,319524.16");
        }
        eNodeB91: eNodeB {
            @display("p=245707.67,323509.53");
        }
        eNodeB92: eNodeB {
            @display("p=248750.44,327224.02");
        }
        eNodeB93: eNodeB {
            @display("p=252254.92,330479.61");
        }
        eNodeB94: eNodeB {
            @display("p=256394.71,332878.9");
        }
        eNodeB95: eNodeB {
            @display("p=260402.41,335521.89");
        }
        eNodeB96: eNodeB {
            @display("p=264431.2,338133.85");
        }
        eNodeB97: eNodeB {
            @display("p=268439.54,340829.58");
        }
        eNodeB98: eNodeB {
            @display("p=272220.87,343896.38");
        }
        eNodeB99: eNodeB {
            @display("p=276269.95,346134.36");
        }
        eNodeB100: eNodeB {
            @display("p=280975.49,347086.74");
        }
        eNodeB101: eNodeB {
            @display("p=285638.05,348231.18");
        }
        eNodeB102: eNodeB {
            @display("p=290199.33,347396.06");
        }
        eNodeB103: eNodeB {
            @display("p=294943.62,346733.36");
        }
        eNodeB104: eNodeB {
            @display("p=299743.74,346746.53");
        }
        eNodeB105: eNodeB {
            @display("p=304500.4,347669.59");
        }
        eNodeB106: eNodeB {
            @display("p=308614.4,349832.85");
        }
        eNodeB107: eNodeB {
            @display("p=310443.33,354270.15");
        }
        eNodeB108: eNodeB {
            @display("p=312712.79,358487.71");
        }
        eNodeB109: eNodeB {
            @display("p=314253.45,362930.19");
        }
        eNodeB110: eNodeB {
            @display("p=314583.17,367221.43");
        }
        eNodeB111: eNodeB {
            @display("p=316744.05,371426.24");
        }
        eNodeB112: eNodeB {
            @display("p=319397.7,375243.27");
        }
        eNodeB113: eNodeB {
            @display("p=322877.69,378532.35");
        }
        eNodeB114: eNodeB {
            @display("p=326495.88,381663.25");
        }
        eNodeB115: eNodeB {
            @display("p=329199.29,385507.7");
        }
        eNodeB116: eNodeB {
            @display("p=330615.07,390126.23");
        }
        eNodeB117: eNodeB {
            @display("p=331692.2,394800.79");
        }
        eNodeB118: eNodeB {
            @display("p=333664.62,399152.32");
        }
        eNodeB119: eNodeB {
            @display("p=333844.65,403938.39");
        }
        eNodeB120: eNodeB {
            @display("p=335072.77,408567.2");
        }
        eNodeB121: eNodeB {
            @display("p=337387.32,412750.44");
        }
        eNodeB122: eNodeB {
            @display("p=339319.75,417180.52");
        }
        eNodeB123: eNodeB {
            @display("p=342724.36,420425.79");
        }
        eNodeB124: eNodeB {
            @display("p=345025.96,424591.75");
        }
        eNodeB125: eNodeB {
            @display("p=347391.21,428680.87");
        }
        eNodeB126: eNodeB {
            @display("p=351072.26,431705.89");
        }
        eNodeB127: eNodeB {
            @display("p=354208.12,435241.09");
        }
        eNodeB128: eNodeB {
            @display("p=358312.72,437710.34");
        }
        eNodeB129: eNodeB {
            @display("p=363012.29,437847.5");
        }
        eNodeB130: eNodeB {
            @display("p=367509.54,438944.86");
        }
        eNodeB131: eNodeB {
            @display("p=370267.76,442546.57");
        }
        eNodeB132: eNodeB {
            @display("p=373987.8,445303.77");
        }
        eNodeB133: eNodeB {
            @display("p=377142.62,448864.38");
        }
        eNodeB134: eNodeB {
            @display("p=378656.61,453424.01");
        }
        eNodeB135: eNodeB {
            @display("p=381157.59,457473.24");
        }
        eNodeB136: eNodeB {
            @display("p=385162.67,458841.4");
        }
        eNodeB137: eNodeB {
            @display("p=388528.55,461731.69");
        }
        eNodeB138: eNodeB {
            @display("p=390653.81,465870.25");
        }

        car[0]: LteCar {
            @display("i=,,0;p=260002,1077009");
        }

    connections allowunconnected:
        server.pppg++ <--> Eth100G <--> router.pppg++;
        speedtest.pppg++ <--> Eth100G <--> router.pppg++;
        router.pppg++ <--> Eth100G <--> pgw.filterGate;

        pgw.pppg++ <--> Eth100G <--> eNodeB0.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB1.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB2.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB3.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB4.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB5.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB6.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB7.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB8.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB9.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB10.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB11.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB12.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB13.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB14.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB15.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB16.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB17.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB18.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB19.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB20.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB21.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB22.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB23.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB24.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB25.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB26.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB27.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB28.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB29.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB30.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB31.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB32.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB33.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB34.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB35.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB36.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB37.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB38.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB39.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB40.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB41.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB42.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB43.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB44.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB45.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB46.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB47.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB48.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB49.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB50.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB51.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB52.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB53.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB54.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB55.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB56.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB57.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB58.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB59.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB60.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB61.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB62.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB63.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB64.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB65.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB66.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB67.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB68.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB69.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB70.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB71.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB72.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB73.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB74.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB75.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB76.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB77.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB78.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB79.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB80.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB81.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB82.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB83.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB84.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB85.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB86.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB87.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB88.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB89.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB90.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB91.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB92.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB93.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB94.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB95.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB96.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB97.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB98.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB99.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB100.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB101.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB102.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB103.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB104.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB105.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB106.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB107.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB108.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB109.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB110.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB111.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB112.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB113.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB114.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB115.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB116.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB117.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB118.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB119.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB120.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB121.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB122.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB123.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB124.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB125.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB126.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB127.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB128.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB129.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB130.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB131.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB132.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB133.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB134.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB135.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB136.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB137.ppp;
        pgw.pppg++ <--> Eth100G <--> eNodeB138.ppp;

        eNodeB0.x2++ <--> Eth100G <--> eNodeB1.x2++;
        eNodeB1.x2++ <--> Eth100G <--> eNodeB2.x2++;
        eNodeB2.x2++ <--> Eth100G <--> eNodeB3.x2++;
        eNodeB3.x2++ <--> Eth100G <--> eNodeB4.x2++;
        eNodeB4.x2++ <--> Eth100G <--> eNodeB5.x2++;
        eNodeB5.x2++ <--> Eth100G <--> eNodeB6.x2++;
        eNodeB6.x2++ <--> Eth100G <--> eNodeB7.x2++;
        eNodeB7.x2++ <--> Eth100G <--> eNodeB8.x2++;
        eNodeB8.x2++ <--> Eth100G <--> eNodeB9.x2++;
        eNodeB9.x2++ <--> Eth100G <--> eNodeB10.x2++;
        eNodeB10.x2++ <--> Eth100G <--> eNodeB11.x2++;
        eNodeB11.x2++ <--> Eth100G <--> eNodeB12.x2++;
        eNodeB12.x2++ <--> Eth100G <--> eNodeB13.x2++;
        eNodeB13.x2++ <--> Eth100G <--> eNodeB14.x2++;
        eNodeB14.x2++ <--> Eth100G <--> eNodeB15.x2++;
        eNodeB15.x2++ <--> Eth100G <--> eNodeB16.x2++;
        eNodeB16.x2++ <--> Eth100G <--> eNodeB17.x2++;
        eNodeB17.x2++ <--> Eth100G <--> eNodeB18.x2++;
        eNodeB18.x2++ <--> Eth100G <--> eNodeB19.x2++;
        eNodeB19.x2++ <--> Eth100G <--> eNodeB20.x2++;
        eNodeB20.x2++ <--> Eth100G <--> eNodeB21.x2++;
        eNodeB21.x2++ <--> Eth100G <--> eNodeB22.x2++;
        eNodeB22.x2++ <--> Eth100G <--> eNodeB23.x2++;
        eNodeB23.x2++ <--> Eth100G <--> eNodeB24.x2++;
        eNodeB24.x2++ <--> Eth100G <--> eNodeB25.x2++;
        eNodeB25.x2++ <--> Eth100G <--> eNodeB26.x2++;
        eNodeB26.x2++ <--> Eth100G <--> eNodeB27.x2++;
        eNodeB27.x2++ <--> Eth100G <--> eNodeB28.x2++;
        eNodeB28.x2++ <--> Eth100G <--> eNodeB29.x2++;
        eNodeB29.x2++ <--> Eth100G <--> eNodeB30.x2++;
        eNodeB30.x2++ <--> Eth100G <--> eNodeB31.x2++;
        eNodeB31.x2++ <--> Eth100G <--> eNodeB32.x2++;
        eNodeB32.x2++ <--> Eth100G <--> eNodeB33.x2++;
        eNodeB33.x2++ <--> Eth100G <--> eNodeB34.x2++;
        eNodeB34.x2++ <--> Eth100G <--> eNodeB35.x2++;
        eNodeB35.x2++ <--> Eth100G <--> eNodeB36.x2++;
        eNodeB36.x2++ <--> Eth100G <--> eNodeB37.x2++;
        eNodeB37.x2++ <--> Eth100G <--> eNodeB38.x2++;
        eNodeB38.x2++ <--> Eth100G <--> eNodeB39.x2++;
        eNodeB39.x2++ <--> Eth100G <--> eNodeB40.x2++;
        eNodeB40.x2++ <--> Eth100G <--> eNodeB41.x2++;
        eNodeB41.x2++ <--> Eth100G <--> eNodeB42.x2++;
        eNodeB42.x2++ <--> Eth100G <--> eNodeB43.x2++;
        eNodeB43.x2++ <--> Eth100G <--> eNodeB44.x2++;
        eNodeB44.x2++ <--> Eth100G <--> eNodeB45.x2++;
        eNodeB45.x2++ <--> Eth100G <--> eNodeB46.x2++;
        eNodeB46.x2++ <--> Eth100G <--> eNodeB47.x2++;
        eNodeB47.x2++ <--> Eth100G <--> eNodeB48.x2++;
        eNodeB48.x2++ <--> Eth100G <--> eNodeB49.x2++;
        eNodeB49.x2++ <--> Eth100G <--> eNodeB50.x2++;
        eNodeB50.x2++ <--> Eth100G <--> eNodeB51.x2++;
        eNodeB51.x2++ <--> Eth100G <--> eNodeB52.x2++;
        eNodeB52.x2++ <--> Eth100G <--> eNodeB53.x2++;
        eNodeB53.x2++ <--> Eth100G <--> eNodeB54.x2++;
        eNodeB54.x2++ <--> Eth100G <--> eNodeB55.x2++;
        eNodeB55.x2++ <--> Eth100G <--> eNodeB56.x2++;
        eNodeB56.x2++ <--> Eth100G <--> eNodeB57.x2++;
        eNodeB57.x2++ <--> Eth100G <--> eNodeB58.x2++;
        eNodeB58.x2++ <--> Eth100G <--> eNodeB59.x2++;
        eNodeB59.x2++ <--> Eth100G <--> eNodeB60.x2++;
        eNodeB60.x2++ <--> Eth100G <--> eNodeB61.x2++;
        eNodeB61.x2++ <--> Eth100G <--> eNodeB62.x2++;
        eNodeB62.x2++ <--> Eth100G <--> eNodeB63.x2++;
        eNodeB63.x2++ <--> Eth100G <--> eNodeB64.x2++;
        eNodeB64.x2++ <--> Eth100G <--> eNodeB65.x2++;
        eNodeB65.x2++ <--> Eth100G <--> eNodeB66.x2++;
        eNodeB66.x2++ <--> Eth100G <--> eNodeB67.x2++;
        eNodeB67.x2++ <--> Eth100G <--> eNodeB68.x2++;
        eNodeB68.x2++ <--> Eth100G <--> eNodeB69.x2++;
        eNodeB69.x2++ <--> Eth100G <--> eNodeB70.x2++;
        eNodeB70.x2++ <--> Eth100G <--> eNodeB71.x2++;
        eNodeB71.x2++ <--> Eth100G <--> eNodeB72.x2++;
        eNodeB72.x2++ <--> Eth100G <--> eNodeB73.x2++;
        eNodeB73.x2++ <--> Eth100G <--> eNodeB74.x2++;
        eNodeB74.x2++ <--> Eth100G <--> eNodeB75.x2++;
        eNodeB75.x2++ <--> Eth100G <--> eNodeB76.x2++;
        eNodeB76.x2++ <--> Eth100G <--> eNodeB77.x2++;
        eNodeB77.x2++ <--> Eth100G <--> eNodeB78.x2++;
        eNodeB78.x2++ <--> Eth100G <--> eNodeB79.x2++;
        eNodeB79.x2++ <--> Eth100G <--> eNodeB80.x2++;
        eNodeB80.x2++ <--> Eth100G <--> eNodeB81.x2++;
        eNodeB81.x2++ <--> Eth100G <--> eNodeB82.x2++;
        eNodeB82.x2++ <--> Eth100G <--> eNodeB83.x2++;
        eNodeB83.x2++ <--> Eth100G <--> eNodeB84.x2++;
        eNodeB84.x2++ <--> Eth100G <--> eNodeB85.x2++;
        eNodeB85.x2++ <--> Eth100G <--> eNodeB86.x2++;
        eNodeB86.x2++ <--> Eth100G <--> eNodeB87.x2++;
        eNodeB87.x2++ <--> Eth100G <--> eNodeB88.x2++;
        eNodeB88.x2++ <--> Eth100G <--> eNodeB89.x2++;
        eNodeB89.x2++ <--> Eth100G <--> eNodeB90.x2++;
        eNodeB90.x2++ <--> Eth100G <--> eNodeB91.x2++;
        eNodeB91.x2++ <--> Eth100G <--> eNodeB92.x2++;
        eNodeB92.x2++ <--> Eth100G <--> eNodeB93.x2++;
        eNodeB93.x2++ <--> Eth100G <--> eNodeB94.x2++;
        eNodeB94.x2++ <--> Eth100G <--> eNodeB95.x2++;
        eNodeB95.x2++ <--> Eth100G <--> eNodeB96.x2++;
        eNodeB96.x2++ <--> Eth100G <--> eNodeB97.x2++;
        eNodeB97.x2++ <--> Eth100G <--> eNodeB98.x2++;
        eNodeB98.x2++ <--> Eth100G <--> eNodeB99.x2++;
        eNodeB99.x2++ <--> Eth100G <--> eNodeB100.x2++;
        eNodeB100.x2++ <--> Eth100G <--> eNodeB101.x2++;
        eNodeB101.x2++ <--> Eth100G <--> eNodeB102.x2++;
        eNodeB102.x2++ <--> Eth100G <--> eNodeB103.x2++;
        eNodeB103.x2++ <--> Eth100G <--> eNodeB104.x2++;
        eNodeB104.x2++ <--> Eth100G <--> eNodeB105.x2++;
        eNodeB105.x2++ <--> Eth100G <--> eNodeB106.x2++;
        eNodeB106.x2++ <--> Eth100G <--> eNodeB107.x2++;
        eNodeB107.x2++ <--> Eth100G <--> eNodeB108.x2++;
        eNodeB108.x2++ <--> Eth100G <--> eNodeB109.x2++;
        eNodeB109.x2++ <--> Eth100G <--> eNodeB110.x2++;
        eNodeB110.x2++ <--> Eth100G <--> eNodeB111.x2++;
        eNodeB111.x2++ <--> Eth100G <--> eNodeB112.x2++;
        eNodeB112.x2++ <--> Eth100G <--> eNodeB113.x2++;
        eNodeB113.x2++ <--> Eth100G <--> eNodeB114.x2++;
        eNodeB114.x2++ <--> Eth100G <--> eNodeB115.x2++;
        eNodeB115.x2++ <--> Eth100G <--> eNodeB116.x2++;
        eNodeB116.x2++ <--> Eth100G <--> eNodeB117.x2++;
        eNodeB117.x2++ <--> Eth100G <--> eNodeB118.x2++;
        eNodeB118.x2++ <--> Eth100G <--> eNodeB119.x2++;
        eNodeB119.x2++ <--> Eth100G <--> eNodeB120.x2++;
        eNodeB120.x2++ <--> Eth100G <--> eNodeB121.x2++;
        eNodeB121.x2++ <--> Eth100G <--> eNodeB122.x2++;
        eNodeB122.x2++ <--> Eth100G <--> eNodeB123.x2++;
        eNodeB123.x2++ <--> Eth100G <--> eNodeB124.x2++;
        eNodeB124.x2++ <--> Eth100G <--> eNodeB125.x2++;
        eNodeB125.x2++ <--> Eth100G <--> eNodeB126.x2++;
        eNodeB126.x2++ <--> Eth100G <--> eNodeB127.x2++;
        eNodeB127.x2++ <--> Eth100G <--> eNodeB128.x2++;
        eNodeB128.x2++ <--> Eth100G <--> eNodeB129.x2++;
        eNodeB129.x2++ <--> Eth100G <--> eNodeB130.x2++;
        eNodeB130.x2++ <--> Eth100G <--> eNodeB131.x2++;
        eNodeB131.x2++ <--> Eth100G <--> eNodeB132.x2++;
        eNodeB132.x2++ <--> Eth100G <--> eNodeB133.x2++;
        eNodeB133.x2++ <--> Eth100G <--> eNodeB134.x2++;
        eNodeB134.x2++ <--> Eth100G <--> eNodeB135.x2++;
        eNodeB135.x2++ <--> Eth100G <--> eNodeB136.x2++;
        eNodeB136.x2++ <--> Eth100G <--> eNodeB137.x2++;
        eNodeB137.x2++ <--> Eth100G <--> eNodeB138.x2++;
}
