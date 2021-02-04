class CfgPatches {
    class JD_Radar {
        name = "JD: Radar";
        author = "John Doe";
        url = "https://jdtools.dev/";
        requiredVersion = 2.0;
        requiredAddons[] = {"A3_Weapons_F", "cba_common"};
    };
};

class cfgFunctions {
    class JDR {
        tag = "JDR";
        class Scripts {
            file = "\JD_Radar\scripts";
            class Init {
                postInit = 1;
            };
            class anprLoop {};
            class patrolSpeedLoop {};
            class radarLoop {};
            class isVisibleToRadar {};
            class isVisibleToANPR {};
            class getVehInfo {};
            class isWanted {};
            class toggleSystem {};
            class hasRadar {};
        };
    };
};

class RscTitles {
    class JDRadar {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 1e+11;
        onLoad = "uinamespace setvariable ['JDRadar',_this select 0]";
        onUnload = "uinamespace setvariable ['JDRadar',nil]";
        class ControlsBackground {
            class BackgroundBlack {
                type = 0;
                idc = -1;
                x = safeZoneX + safeZoneW * 0.78375;
                y = safeZoneY + safeZoneH * 0.90888889;
                w = safeZoneW * 0.2125;
                h = safeZoneH * 0.07555556;
                style = 0;
                text = "";
                colorBackground[] = {0, 0, 0, 0.7};
                colorText[] = {0.1529, 0.1765, 0.9059, 1};
                font = "PuristaMedium";
                sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
                shadow = 0;
            };
            class BackgroundBlack2 : BackgroundBlack {
                x = safeZoneX + safeZoneW * 0.79375;
                y = safeZoneY + safeZoneH * 0.00888889;
                w = safeZoneW * 0.2025;
                h = safeZoneH * 0.14555556;
            };
            class PatrolLabel {
                type = 0;
                idc = -1;
                x = safeZoneX + safeZoneW * 0.92875;
                y = safeZoneY + safeZoneH * 0.91888889;
                w = safeZoneW * 0.0625;
                h = safeZoneH * 0.06111112;
                style = 2 + 64;
                text = "PATROL";
                colorBackground[] = {0.102, 0.102, 0.102, 1};
                colorText[] = {1, 1, 1, 1};
                font = "PuristaMedium";
                sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            };
            class LockLabel : PatrolLabel {
                x = safeZoneX + safeZoneW * 0.85875;
                text = "LOCK";
            };
            class TargetLabel : PatrolLabel {
                x = safeZoneX + safeZoneW * 0.78875;
                text = "TARGET";
            };
            class ANPRLabel : PatrolLabel {
                x = safeZoneX + safeZoneW * 0.79875;
                y = safeZoneY + safeZoneH * 0.01888889;
                w = safeZoneW * 0.1925;
                h = safeZoneH * 0.13111112;
                text = "ANPR";
            };
        };
        class Controls {
            class PatrolSpeed {
                type = 0;
                idc = 1;
                x = safeZoneX + safeZoneW * 0.93375;
                y = safeZoneY + safeZoneH * 0.93;
                w = safeZoneW * 0.0525;
                h = safeZoneH * 0.05;
                style = 2;
                text = "0";
                colorBackground[] = {0, 0, 0, 0};
                colorText[] = {0.102, 0.302, 0.102, 1};
                font = "LCD14";
                sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2.3);
            };
            class LockSpeed : PatrolSpeed {
                idc = 2;
                x = safeZoneX + safeZoneW * 0.86375;
                colorText[] = {0.6, 0, 0, 1};
            };
            class TargetSpeed : PatrolSpeed {
                idc = 3;
                x = safeZoneX + safeZoneW * 0.79375;
                colorText[] = {0.6, 0.2, 0, 1};
            };
            class ANPRinfo {
                type = 13;
                idc = 5;
                x = safeZoneX + safeZoneW * 0.80375;
                y = safeZoneY + safeZoneH * 0.03444445;
                w = safeZoneW * 0.1825;
                h = safeZoneH * 0.10555556;
                style = 0;
                text = "<t size='1.1' color='#a6a6a6' align='center' valign='middle'>Scanning...</t>";
                size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
                colorBackground[] = {1, 1, 1, 0};
                class Attributes {
                };
            };
        };
    };
};

class CfgSounds {
    class JD_RadarBeep {
        name = "JD_RadarBeep";
        sound[] = {"JD_Radar\Sounds\done.ogg", db - 0, 1, 5};
        titles[] = {0, ""};
    };
    class JD_RadarOn {
        name = "JD_RadarBeep";
        sound[] = {"JD_Radar\Sounds\xmit_on.ogg", db - 1, 1, 5};
        titles[] = {0, ""};
    };
    class JD_RadarOff {
        name = "JD_RadarBeep";
        sound[] = {"JD_Radar\Sounds\xmit_off.ogg", db - 1, 1, 5};
        titles[] = {0, ""};
    };
};

class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;

    class JDR_RadarJammer: CBA_MiscItem {
        author = "John Doe";
        displayName = "Radar Jammer";
        descriptionShort = "Place in vehicle inventory";
        model = "\a3\Weapons_F\Ammo\mag_FirstAidkit.p3d";
        picture = "\A3\Weapons_F\Items\data\UI\gear_gps_CA.paa";
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };
};