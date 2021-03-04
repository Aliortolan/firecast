require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaACN()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmFichaACN");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.FichaACN");
    obj:setTitle("Ficha ACN");
    obj:setAlign("client");
    obj:setTheme("dark");


        local function isNewVersion(installed, downloaded)
            local installedVersion = {};
            local installedIndex = 0;
            for i in string.gmatch(installed, "[^%.]+") do
                installedIndex = installedIndex +1;
                installedVersion[installedIndex] = i;
            end

            local downloadedVersion = {};
            local downloadedIndex = 0;
            for i in string.gmatch(downloaded, "[^%.]+") do
                downloadedIndex = downloadedIndex +1;
                downloadedVersion[downloadedIndex] = i;
            end

            for i=1, math.min(installedIndex, downloadedIndex), 1 do 
                if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
                    return false;
                elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
                    return true;
                end;
            end;

            if downloadedIndex > installedIndex then
                return true;
            else
                return false;
            end;
        end;
        


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmACN1 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN1:setParent(obj.tab1);
    obj.frmACN1:setName("frmACN1");
    obj.frmACN1:setAlign("client");
    obj.frmACN1:setTheme("dark");

    obj.popOther = GUI.fromHandle(_obj_newObject("popup"));
    obj.popOther:setParent(obj.frmACN1);
    obj.popOther:setName("popOther");
    obj.popOther:setWidth(200);
    obj.popOther:setHeight(150);
    obj.popOther:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popOther, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popOther);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(30);
    obj.flowPart1:setMaxWidth(50);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Inicial");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("inicial");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(30);
    obj.flowPart2:setMaxWidth(50);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Apr.");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("client");
    obj.edit2:setField("aprimoramento");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(30);
    obj.flowPart3:setMaxWidth(50);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("XP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("xp");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(30);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Custo Apr.");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("multApr");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(30);
    obj.flowPart5:setMaxWidth(50);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("Custo XP");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart5);
    obj.edit5:setAlign("client");
    obj.edit5:setField("multXp");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popOther);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmACN1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(960);
    obj.layout1:setHeight(70);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(5);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(950);
    obj.rectangle1:setHeight(70);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("Nome");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setLeft(110);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("nome");
    obj.edit6:setName("edit6");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(320);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(100);
    obj.label7:setHeight(20);
    obj.label7:setText("Conceito");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(110);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("conceito");
    obj.edit7:setName("edit7");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(585);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(310);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(100);
    obj.label8:setHeight(20);
    obj.label8:setText("Facção");
    obj.label8:setHorzTextAlign("trailing");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setLeft(110);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("faccao");
    obj.edit8:setName("edit8");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(310);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout5);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(100);
    obj.label9:setHeight(20);
    obj.label9:setText("Ímpeto");
    obj.label9:setHorzTextAlign("trailing");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setLeft(110);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(25);
    obj.edit9:setField("impeto");
    obj.edit9:setName("edit9");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(320);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(310);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout6);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(100);
    obj.label10:setHeight(20);
    obj.label10:setText("Comportamento");
    obj.label10:setHorzTextAlign("trailing");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setLeft(110);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(200);
    obj.edit10:setHeight(25);
    obj.edit10:setField("comportamento");
    obj.edit10:setName("edit10");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(585);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(310);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(100);
    obj.label11:setHeight(20);
    obj.label11:setText("Direção");
    obj.label11:setHorzTextAlign("trailing");
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setLeft(110);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(200);
    obj.edit11:setHeight(25);
    obj.edit11:setField("direcao");
    obj.edit11:setName("edit11");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(75);
    obj.layout8:setWidth(315);
    obj.layout8:setHeight(245);
    obj.layout8:setName("layout8");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setLeft(5);
    obj.label12:setTop(0);
    obj.label12:setWidth(315);
    obj.label12:setHeight(20);
    obj.label12:setText("ATRIBUTOS");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13:setLeft(250);
    obj.label13:setTop(80);
    obj.label13:setWidth(100);
    obj.label13:setHeight(20);
    obj.label13:setText("Físicos");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setRotationAngle(90);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setLeft(250);
    obj.label14:setTop(175);
    obj.label14:setWidth(100);
    obj.label14:setHeight(20);
    obj.label14:setText("Mentais");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setRotationAngle(90);
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout8);
    obj.label15:setLeft(105);
    obj.label15:setTop(25);
    obj.label15:setWidth(315);
    obj.label15:setHeight(20);
    obj.label15:setText(" Total");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout8);
    obj.label16:setLeft(150);
    obj.label16:setTop(25);
    obj.label16:setWidth(315);
    obj.label16:setHeight(20);
    obj.label16:setText("Base");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout8);
    obj.label17:setLeft(185);
    obj.label17:setTop(25);
    obj.label17:setWidth(315);
    obj.label17:setHeight(20);
    obj.label17:setText(" Inic");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout8);
    obj.label18:setLeft(220);
    obj.label18:setTop(25);
    obj.label18:setWidth(315);
    obj.label18:setHeight(20);
    obj.label18:setText(" Apr.");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout8);
    obj.label19:setLeft(255);
    obj.label19:setTop(25);
    obj.label19:setWidth(315);
    obj.label19:setHeight(20);
    obj.label19:setText("  XP");
    obj.label19:setName("label19");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(50);
    obj.layout9:setWidth(315);
    obj.layout9:setHeight(30);
    obj.layout9:setName("layout9");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout9);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setHeight(15);
    obj.button1:setWidth(15);
    obj.button1:setText("1");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout9);
    obj.button2:setLeft(0);
    obj.button2:setTop(13);
    obj.button2:setHeight(15);
    obj.button2:setWidth(15);
    obj.button2:setText("2");
    obj.button2:setName("button2");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout9);
    obj.label20:setLeft(20);
    obj.label20:setTop(5);
    obj.label20:setWidth(85);
    obj.label20:setHeight(20);
    obj.label20:setText("Força");
    obj.label20:setName("label20");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout9);
    obj.rectangle3:setLeft(100);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(40);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout9);
    obj.label21:setLeft(100);
    obj.label21:setTop(3);
    obj.label21:setWidth(40);
    obj.label21:setHeight(20);
    obj.label21:setField("totalforca");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout9);
    obj.rectangle4:setLeft(145);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout9);
    obj.label22:setLeft(145);
    obj.label22:setTop(0);
    obj.label22:setWidth(30);
    obj.label22:setHeight(25);
    obj.label22:setField("baseforca");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setVertTextAlign("center");
    obj.label22:setName("label22");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout9);
    obj.dataLink1:setField("baseforca");
    obj.dataLink1:setDefaultValue("3");
    obj.dataLink1:setName("dataLink1");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout9);
    obj.edit12:setLeft(180);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setField("inicialforca");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout9);
    obj.edit13:setLeft(215);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setField("bonusforca");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout9);
    obj.edit14:setLeft(250);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setField("xpforca");
    obj.edit14:setName("edit14");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout9);
    obj.dataLink2:setFields({'baseforca', 'inicialforca', 'bonusforca', 'xpforca', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink2:setName("dataLink2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(80);
    obj.layout10:setWidth(315);
    obj.layout10:setHeight(30);
    obj.layout10:setName("layout10");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout10);
    obj.button3:setLeft(0);
    obj.button3:setTop(0);
    obj.button3:setHeight(15);
    obj.button3:setWidth(15);
    obj.button3:setText("1");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout10);
    obj.button4:setLeft(0);
    obj.button4:setTop(13);
    obj.button4:setHeight(15);
    obj.button4:setWidth(15);
    obj.button4:setText("2");
    obj.button4:setName("button4");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout10);
    obj.label23:setLeft(20);
    obj.label23:setTop(5);
    obj.label23:setWidth(85);
    obj.label23:setHeight(20);
    obj.label23:setText("Agilidade");
    obj.label23:setName("label23");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout10);
    obj.rectangle5:setLeft(100);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout10);
    obj.label24:setLeft(100);
    obj.label24:setTop(3);
    obj.label24:setWidth(40);
    obj.label24:setHeight(20);
    obj.label24:setField("totalagilidade");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout10);
    obj.rectangle6:setLeft(145);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout10);
    obj.label25:setLeft(145);
    obj.label25:setTop(0);
    obj.label25:setWidth(30);
    obj.label25:setHeight(25);
    obj.label25:setField("baseagilidade");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setVertTextAlign("center");
    obj.label25:setName("label25");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout10);
    obj.dataLink3:setField("baseagilidade");
    obj.dataLink3:setDefaultValue("3");
    obj.dataLink3:setName("dataLink3");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout10);
    obj.edit15:setLeft(180);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setType("number");
    obj.edit15:setField("inicialagilidade");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout10);
    obj.edit16:setLeft(215);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setType("number");
    obj.edit16:setField("bonusagilidade");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout10);
    obj.edit17:setLeft(250);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setType("number");
    obj.edit17:setField("xpagilidade");
    obj.edit17:setName("edit17");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout10);
    obj.dataLink4:setFields({'baseagilidade', 'inicialagilidade', 'bonusagilidade', 'xpagilidade', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink4:setName("dataLink4");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(110);
    obj.layout11:setWidth(315);
    obj.layout11:setHeight(30);
    obj.layout11:setName("layout11");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout11);
    obj.button5:setLeft(0);
    obj.button5:setTop(0);
    obj.button5:setHeight(15);
    obj.button5:setWidth(15);
    obj.button5:setText("1");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout11);
    obj.button6:setLeft(0);
    obj.button6:setTop(13);
    obj.button6:setHeight(15);
    obj.button6:setWidth(15);
    obj.button6:setText("2");
    obj.button6:setName("button6");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout11);
    obj.label26:setLeft(20);
    obj.label26:setTop(5);
    obj.label26:setWidth(85);
    obj.label26:setHeight(20);
    obj.label26:setText("Resiliência");
    obj.label26:setName("label26");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout11);
    obj.rectangle7:setLeft(100);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(40);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout11);
    obj.label27:setLeft(100);
    obj.label27:setTop(3);
    obj.label27:setWidth(40);
    obj.label27:setHeight(20);
    obj.label27:setField("totalresiliencia");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout11);
    obj.rectangle8:setLeft(145);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout11);
    obj.label28:setLeft(145);
    obj.label28:setTop(0);
    obj.label28:setWidth(30);
    obj.label28:setHeight(25);
    obj.label28:setField("baseresiliencia");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setVertTextAlign("center");
    obj.label28:setName("label28");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout11);
    obj.dataLink5:setField("baseresiliencia");
    obj.dataLink5:setDefaultValue("3");
    obj.dataLink5:setName("dataLink5");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout11);
    obj.edit18:setLeft(180);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setField("inicialresiliencia");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout11);
    obj.edit19:setLeft(215);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setType("number");
    obj.edit19:setField("bonusresiliencia");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout11);
    obj.edit20:setLeft(250);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setType("number");
    obj.edit20:setField("xpresiliencia");
    obj.edit20:setName("edit20");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout11);
    obj.dataLink6:setFields({'baseresiliencia', 'inicialresiliencia', 'bonusresiliencia', 'xpresiliencia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink6:setName("dataLink6");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout8);
    obj.horzLine1:setLeft(0);
    obj.horzLine1:setTop(145);
    obj.horzLine1:setWidth(315);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(150);
    obj.layout12:setWidth(315);
    obj.layout12:setHeight(30);
    obj.layout12:setName("layout12");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout12);
    obj.button7:setLeft(0);
    obj.button7:setTop(0);
    obj.button7:setHeight(15);
    obj.button7:setWidth(15);
    obj.button7:setText("1");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout12);
    obj.button8:setLeft(0);
    obj.button8:setTop(13);
    obj.button8:setHeight(15);
    obj.button8:setWidth(15);
    obj.button8:setText("2");
    obj.button8:setName("button8");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout12);
    obj.label29:setLeft(20);
    obj.label29:setTop(5);
    obj.label29:setWidth(85);
    obj.label29:setHeight(20);
    obj.label29:setText("Carisma");
    obj.label29:setName("label29");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout12);
    obj.rectangle9:setLeft(100);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout12);
    obj.label30:setLeft(100);
    obj.label30:setTop(3);
    obj.label30:setWidth(40);
    obj.label30:setHeight(20);
    obj.label30:setField("totalcarisma");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout12);
    obj.rectangle10:setLeft(145);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout12);
    obj.label31:setLeft(145);
    obj.label31:setTop(0);
    obj.label31:setWidth(30);
    obj.label31:setHeight(25);
    obj.label31:setField("basecarisma");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setVertTextAlign("center");
    obj.label31:setName("label31");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout12);
    obj.dataLink7:setField("basecarisma");
    obj.dataLink7:setDefaultValue("3");
    obj.dataLink7:setName("dataLink7");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout12);
    obj.edit21:setLeft(180);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setType("number");
    obj.edit21:setField("inicialcarisma");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout12);
    obj.edit22:setLeft(215);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setField("bonuscarisma");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout12);
    obj.edit23:setLeft(250);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setType("number");
    obj.edit23:setField("xpcarisma");
    obj.edit23:setName("edit23");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout12);
    obj.dataLink8:setFields({'basecarisma', 'inicialcarisma', 'bonuscarisma', 'xpcarisma', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink8:setName("dataLink8");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(180);
    obj.layout13:setWidth(315);
    obj.layout13:setHeight(30);
    obj.layout13:setName("layout13");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout13);
    obj.button9:setLeft(0);
    obj.button9:setTop(0);
    obj.button9:setHeight(15);
    obj.button9:setWidth(15);
    obj.button9:setText("1");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout13);
    obj.button10:setLeft(0);
    obj.button10:setTop(13);
    obj.button10:setHeight(15);
    obj.button10:setWidth(15);
    obj.button10:setText("2");
    obj.button10:setName("button10");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout13);
    obj.label32:setLeft(20);
    obj.label32:setTop(5);
    obj.label32:setWidth(85);
    obj.label32:setHeight(20);
    obj.label32:setText("Percepção");
    obj.label32:setName("label32");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout13);
    obj.rectangle11:setLeft(100);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout13);
    obj.label33:setLeft(100);
    obj.label33:setTop(3);
    obj.label33:setWidth(40);
    obj.label33:setHeight(20);
    obj.label33:setField("totalpercepcao");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout13);
    obj.rectangle12:setLeft(145);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout13);
    obj.label34:setLeft(145);
    obj.label34:setTop(0);
    obj.label34:setWidth(30);
    obj.label34:setHeight(25);
    obj.label34:setField("basepercepcao");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setVertTextAlign("center");
    obj.label34:setName("label34");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout13);
    obj.dataLink9:setField("basepercepcao");
    obj.dataLink9:setDefaultValue("3");
    obj.dataLink9:setName("dataLink9");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout13);
    obj.edit24:setLeft(180);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setType("number");
    obj.edit24:setField("inicialpercepcao");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout13);
    obj.edit25:setLeft(215);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setType("number");
    obj.edit25:setField("bonuspercepcao");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout13);
    obj.edit26:setLeft(250);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setType("number");
    obj.edit26:setField("xppercepcao");
    obj.edit26:setName("edit26");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout13);
    obj.dataLink10:setFields({'basepercepcao', 'inicialpercepcao', 'bonuspercepcao', 'xppercepcao', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink10:setName("dataLink10");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(210);
    obj.layout14:setWidth(315);
    obj.layout14:setHeight(30);
    obj.layout14:setName("layout14");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout14);
    obj.button11:setLeft(0);
    obj.button11:setTop(0);
    obj.button11:setHeight(15);
    obj.button11:setWidth(15);
    obj.button11:setText("1");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout14);
    obj.button12:setLeft(0);
    obj.button12:setTop(13);
    obj.button12:setHeight(15);
    obj.button12:setWidth(15);
    obj.button12:setText("2");
    obj.button12:setName("button12");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout14);
    obj.label35:setLeft(20);
    obj.label35:setTop(5);
    obj.label35:setWidth(85);
    obj.label35:setHeight(20);
    obj.label35:setText("Perspicácia");
    obj.label35:setName("label35");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout14);
    obj.rectangle13:setLeft(100);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout14);
    obj.label36:setLeft(100);
    obj.label36:setTop(3);
    obj.label36:setWidth(40);
    obj.label36:setHeight(20);
    obj.label36:setField("totalperspicacia");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout14);
    obj.rectangle14:setLeft(145);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout14);
    obj.label37:setLeft(145);
    obj.label37:setTop(0);
    obj.label37:setWidth(30);
    obj.label37:setHeight(25);
    obj.label37:setField("baseperspicacia");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setVertTextAlign("center");
    obj.label37:setName("label37");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout14);
    obj.dataLink11:setField("baseperspicacia");
    obj.dataLink11:setDefaultValue("3");
    obj.dataLink11:setName("dataLink11");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout14);
    obj.edit27:setLeft(180);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setType("number");
    obj.edit27:setField("inicialperspicacia");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout14);
    obj.edit28:setLeft(215);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setType("number");
    obj.edit28:setField("bonusperspicacia");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout14);
    obj.edit29:setLeft(250);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setType("number");
    obj.edit29:setField("xpperspicacia");
    obj.edit29:setName("edit29");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout14);
    obj.dataLink12:setFields({'baseperspicacia', 'inicialperspicacia', 'bonusperspicacia', 'xpperspicacia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink12:setName("dataLink12");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox1);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(325);
    obj.layout15:setWidth(315);
    obj.layout15:setHeight(185);
    obj.layout15:setName("layout15");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout15);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(15);
    obj.rectangle15:setYradius(15);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout15);
    obj.label38:setLeft(5);
    obj.label38:setTop(0);
    obj.label38:setWidth(315);
    obj.label38:setHeight(20);
    obj.label38:setText("EIDOLON");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout15);
    obj.label39:setLeft(105);
    obj.label39:setTop(25);
    obj.label39:setWidth(315);
    obj.label39:setHeight(20);
    obj.label39:setText(" Total");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout15);
    obj.label40:setLeft(150);
    obj.label40:setTop(25);
    obj.label40:setWidth(315);
    obj.label40:setHeight(20);
    obj.label40:setText("Base");
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout15);
    obj.label41:setLeft(185);
    obj.label41:setTop(25);
    obj.label41:setWidth(315);
    obj.label41:setHeight(20);
    obj.label41:setText(" Inic");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout15);
    obj.label42:setLeft(220);
    obj.label42:setTop(25);
    obj.label42:setWidth(315);
    obj.label42:setHeight(20);
    obj.label42:setText(" Apr.");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout15);
    obj.label43:setLeft(255);
    obj.label43:setTop(25);
    obj.label43:setWidth(315);
    obj.label43:setHeight(20);
    obj.label43:setText("  XP");
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout15);
    obj.label44:setLeft(250);
    obj.label44:setTop(80);
    obj.label44:setWidth(100);
    obj.label44:setHeight(20);
    obj.label44:setText("Aegis");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setRotationAngle(90);
    obj.label44:setName("label44");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(50);
    obj.layout16:setWidth(315);
    obj.layout16:setHeight(30);
    obj.layout16:setName("layout16");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout16);
    obj.button13:setLeft(0);
    obj.button13:setTop(0);
    obj.button13:setHeight(15);
    obj.button13:setWidth(15);
    obj.button13:setText("1");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout16);
    obj.button14:setLeft(0);
    obj.button14:setTop(13);
    obj.button14:setHeight(15);
    obj.button14:setWidth(15);
    obj.button14:setText("2");
    obj.button14:setName("button14");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout16);
    obj.label45:setLeft(20);
    obj.label45:setTop(5);
    obj.label45:setWidth(85);
    obj.label45:setHeight(20);
    obj.label45:setText("Consciência");
    obj.label45:setName("label45");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout16);
    obj.rectangle16:setLeft(100);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(40);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout16);
    obj.label46:setLeft(100);
    obj.label46:setTop(3);
    obj.label46:setWidth(40);
    obj.label46:setHeight(20);
    obj.label46:setField("totalconsciencia");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout16);
    obj.rectangle17:setLeft(145);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(30);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout16);
    obj.label47:setLeft(145);
    obj.label47:setTop(0);
    obj.label47:setWidth(30);
    obj.label47:setHeight(25);
    obj.label47:setField("baseconsciencia");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    obj.label47:setName("label47");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout16);
    obj.dataLink13:setField("baseconsciencia");
    obj.dataLink13:setDefaultValue("1");
    obj.dataLink13:setName("dataLink13");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout16);
    obj.edit30:setLeft(180);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setType("number");
    obj.edit30:setField("inicialconsciencia");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout16);
    obj.edit31:setLeft(215);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(30);
    obj.edit31:setHeight(25);
    obj.edit31:setType("number");
    obj.edit31:setField("bonusconsciencia");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout16);
    obj.edit32:setLeft(250);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setType("number");
    obj.edit32:setField("xpconsciencia");
    obj.edit32:setName("edit32");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout16);
    obj.dataLink14:setFields({'baseconsciencia', 'inicialconsciencia', 'bonusconsciencia', 'xpconsciencia', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink14:setName("dataLink14");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(80);
    obj.layout17:setWidth(315);
    obj.layout17:setHeight(30);
    obj.layout17:setName("layout17");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout17);
    obj.button15:setLeft(0);
    obj.button15:setTop(0);
    obj.button15:setHeight(15);
    obj.button15:setWidth(15);
    obj.button15:setText("1");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout17);
    obj.button16:setLeft(0);
    obj.button16:setTop(13);
    obj.button16:setHeight(15);
    obj.button16:setWidth(15);
    obj.button16:setText("2");
    obj.button16:setName("button16");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout17);
    obj.label48:setLeft(20);
    obj.label48:setTop(5);
    obj.label48:setWidth(85);
    obj.label48:setHeight(20);
    obj.label48:setText("Espírito");
    obj.label48:setName("label48");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout17);
    obj.rectangle18:setLeft(100);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout17);
    obj.label49:setLeft(100);
    obj.label49:setTop(3);
    obj.label49:setWidth(40);
    obj.label49:setHeight(20);
    obj.label49:setField("totalespirito");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout17);
    obj.rectangle19:setLeft(145);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(30);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout17);
    obj.label50:setLeft(145);
    obj.label50:setTop(0);
    obj.label50:setWidth(30);
    obj.label50:setHeight(25);
    obj.label50:setField("baseespirito");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");
    obj.label50:setName("label50");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout17);
    obj.dataLink15:setField("baseespirito");
    obj.dataLink15:setDefaultValue("1");
    obj.dataLink15:setName("dataLink15");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout17);
    obj.edit33:setLeft(180);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(25);
    obj.edit33:setType("number");
    obj.edit33:setField("inicialespirito");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout17);
    obj.edit34:setLeft(215);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setType("number");
    obj.edit34:setField("bonusespirito");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout17);
    obj.edit35:setLeft(250);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(25);
    obj.edit35:setType("number");
    obj.edit35:setField("xpespirito");
    obj.edit35:setName("edit35");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout17);
    obj.dataLink16:setFields({'baseespirito', 'inicialespirito', 'bonusespirito', 'xpespirito', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink16:setName("dataLink16");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(110);
    obj.layout18:setWidth(315);
    obj.layout18:setHeight(30);
    obj.layout18:setName("layout18");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout18);
    obj.button17:setLeft(0);
    obj.button17:setTop(0);
    obj.button17:setHeight(15);
    obj.button17:setWidth(15);
    obj.button17:setText("1");
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout18);
    obj.button18:setLeft(0);
    obj.button18:setTop(13);
    obj.button18:setHeight(15);
    obj.button18:setWidth(15);
    obj.button18:setText("2");
    obj.button18:setName("button18");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout18);
    obj.label51:setLeft(20);
    obj.label51:setTop(5);
    obj.label51:setWidth(85);
    obj.label51:setHeight(20);
    obj.label51:setText("Perseverança");
    obj.label51:setName("label51");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout18);
    obj.rectangle20:setLeft(100);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout18);
    obj.label52:setLeft(100);
    obj.label52:setTop(3);
    obj.label52:setWidth(40);
    obj.label52:setHeight(20);
    obj.label52:setField("totalperseveranca");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout18);
    obj.rectangle21:setLeft(145);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(30);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout18);
    obj.label53:setLeft(145);
    obj.label53:setTop(0);
    obj.label53:setWidth(30);
    obj.label53:setHeight(25);
    obj.label53:setField("baseperseveranca");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");
    obj.label53:setName("label53");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout18);
    obj.dataLink17:setField("baseperseveranca");
    obj.dataLink17:setDefaultValue("1");
    obj.dataLink17:setName("dataLink17");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout18);
    obj.edit36:setLeft(180);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setType("number");
    obj.edit36:setField("inicialperseveranca");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout18);
    obj.edit37:setLeft(215);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(30);
    obj.edit37:setHeight(25);
    obj.edit37:setType("number");
    obj.edit37:setField("bonusperseveranca");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout18);
    obj.edit38:setLeft(250);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(25);
    obj.edit38:setType("number");
    obj.edit38:setField("xpperseveranca");
    obj.edit38:setName("edit38");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout18);
    obj.dataLink18:setFields({'baseperseveranca', 'inicialperseveranca', 'bonusperseveranca', 'xpperseveranca', 'penalidadeEscudo', 'penalidadeArmadura'});
    obj.dataLink18:setName("dataLink18");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout15);
    obj.horzLine2:setLeft(0);
    obj.horzLine2:setTop(145);
    obj.horzLine2:setWidth(315);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(150);
    obj.layout19:setWidth(315);
    obj.layout19:setHeight(30);
    obj.layout19:setName("layout19");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout19);
    obj.label54:setLeft(30);
    obj.label54:setTop(0);
    obj.label54:setWidth(85);
    obj.label54:setHeight(20);
    obj.label54:setText("Gladius");
    obj.label54:setName("label54");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout19);
    obj.edit39:setLeft(175);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(30);
    obj.edit39:setHeight(25);
    obj.edit39:setType("number");
    obj.edit39:setField("gladiusMin");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout19);
    obj.edit40:setLeft(210);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(30);
    obj.edit40:setHeight(25);
    obj.edit40:setType("number");
    obj.edit40:setField("gladiusMax");
    obj.edit40:setName("edit40");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout19);
    obj.progressBar1:setLeft(100);
    obj.progressBar1:setTop(5);
    obj.progressBar1:setWidth(65);
    obj.progressBar1:setHeight(15);
    obj.progressBar1:setColor("blue");
    obj.progressBar1:setHitTest(true);
    obj.progressBar1:setMax(1);
    obj.progressBar1:setField("gladius");
    obj.progressBar1:setName("progressBar1");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(320);
    obj.layout20:setTop(75);
    obj.layout20:setWidth(300);
    obj.layout20:setHeight(320);
    obj.layout20:setName("layout20");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout20);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setXradius(15);
    obj.rectangle22:setYradius(15);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setName("rectangle22");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout20);
    obj.label55:setLeft(0);
    obj.label55:setTop(0);
    obj.label55:setWidth(300);
    obj.label55:setHeight(20);
    obj.label55:setText("HISTORICOS");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout20);
    obj.label56:setLeft(25);
    obj.label56:setTop(20);
    obj.label56:setWidth(315);
    obj.label56:setHeight(20);
    obj.label56:setText(" Nome");
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout20);
    obj.label57:setLeft(135);
    obj.label57:setTop(20);
    obj.label57:setWidth(315);
    obj.label57:setHeight(20);
    obj.label57:setText("Total");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout20);
    obj.label58:setLeft(170);
    obj.label58:setTop(20);
    obj.label58:setWidth(315);
    obj.label58:setHeight(20);
    obj.label58:setText(" Inic");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout20);
    obj.label59:setLeft(202);
    obj.label59:setTop(20);
    obj.label59:setWidth(315);
    obj.label59:setHeight(20);
    obj.label59:setText(" Apr.");
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout20);
    obj.label60:setLeft(235);
    obj.label60:setTop(20);
    obj.label60:setWidth(315);
    obj.label60:setHeight(20);
    obj.label60:setText("  XP");
    obj.label60:setName("label60");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layout20);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(40);
    obj.scrollBox2:setWidth(295);
    obj.scrollBox2:setHeight(260);
    obj.scrollBox2:setName("scrollBox2");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox2);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(0);
    obj.layout21:setWidth(270);
    obj.layout21:setHeight(35);
    obj.layout21:setName("layout21");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout21);
    obj.button19:setLeft(0);
    obj.button19:setTop(0);
    obj.button19:setHeight(15);
    obj.button19:setWidth(15);
    obj.button19:setText("1");
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout21);
    obj.button20:setLeft(0);
    obj.button20:setTop(15);
    obj.button20:setHeight(15);
    obj.button20:setWidth(15);
    obj.button20:setText("2");
    obj.button20:setName("button20");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout21);
    obj.edit41:setLeft(20);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(100);
    obj.edit41:setHeight(25);
    obj.edit41:setField("historicoNome1_1");
    obj.edit41:setName("edit41");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout21);
    obj.rectangle23:setLeft(125);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(35);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("Black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout21);
    obj.label61:setLeft(135);
    obj.label61:setTop(3);
    obj.label61:setWidth(30);
    obj.label61:setHeight(20);
    obj.label61:setField("historicoTotal1_1");
    obj.label61:setName("label61");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout21);
    obj.edit42:setLeft(165);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(30);
    obj.edit42:setHeight(25);
    obj.edit42:setType("number");
    obj.edit42:setMin(0);
    obj.edit42:setField("historicoValor1_1");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout21);
    obj.edit43:setLeft(200);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(30);
    obj.edit43:setHeight(25);
    obj.edit43:setType("number");
    obj.edit43:setMin(0);
    obj.edit43:setField("historicoBonus1_1");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout21);
    obj.edit44:setLeft(235);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(30);
    obj.edit44:setHeight(25);
    obj.edit44:setType("number");
    obj.edit44:setMin(0);
    obj.edit44:setField("historicoXp1_1");
    obj.edit44:setName("edit44");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox2);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(35);
    obj.layout22:setWidth(270);
    obj.layout22:setHeight(35);
    obj.layout22:setName("layout22");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout22);
    obj.button21:setLeft(0);
    obj.button21:setTop(0);
    obj.button21:setHeight(15);
    obj.button21:setWidth(15);
    obj.button21:setText("1");
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout22);
    obj.button22:setLeft(0);
    obj.button22:setTop(15);
    obj.button22:setHeight(15);
    obj.button22:setWidth(15);
    obj.button22:setText("2");
    obj.button22:setName("button22");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout22);
    obj.edit45:setLeft(20);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(100);
    obj.edit45:setHeight(25);
    obj.edit45:setField("historicoNome1_2");
    obj.edit45:setName("edit45");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout22);
    obj.rectangle24:setLeft(125);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(35);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("Black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout22);
    obj.label62:setLeft(135);
    obj.label62:setTop(3);
    obj.label62:setWidth(30);
    obj.label62:setHeight(20);
    obj.label62:setField("historicoTotal1_2");
    obj.label62:setName("label62");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout22);
    obj.edit46:setLeft(165);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(30);
    obj.edit46:setHeight(25);
    obj.edit46:setType("number");
    obj.edit46:setMin(0);
    obj.edit46:setField("historicoValor1_2");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout22);
    obj.edit47:setLeft(200);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(30);
    obj.edit47:setHeight(25);
    obj.edit47:setType("number");
    obj.edit47:setMin(0);
    obj.edit47:setField("historicoBonus1_2");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout22);
    obj.edit48:setLeft(235);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(30);
    obj.edit48:setHeight(25);
    obj.edit48:setType("number");
    obj.edit48:setMin(0);
    obj.edit48:setField("historicoXp1_2");
    obj.edit48:setName("edit48");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox2);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(70);
    obj.layout23:setWidth(270);
    obj.layout23:setHeight(35);
    obj.layout23:setName("layout23");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout23);
    obj.button23:setLeft(0);
    obj.button23:setTop(0);
    obj.button23:setHeight(15);
    obj.button23:setWidth(15);
    obj.button23:setText("1");
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout23);
    obj.button24:setLeft(0);
    obj.button24:setTop(15);
    obj.button24:setHeight(15);
    obj.button24:setWidth(15);
    obj.button24:setText("2");
    obj.button24:setName("button24");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout23);
    obj.edit49:setLeft(20);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(100);
    obj.edit49:setHeight(25);
    obj.edit49:setField("historicoNome1_3");
    obj.edit49:setName("edit49");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout23);
    obj.rectangle25:setLeft(125);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(35);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("Black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout23);
    obj.label63:setLeft(135);
    obj.label63:setTop(3);
    obj.label63:setWidth(30);
    obj.label63:setHeight(20);
    obj.label63:setField("historicoTotal1_3");
    obj.label63:setName("label63");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout23);
    obj.edit50:setLeft(165);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(30);
    obj.edit50:setHeight(25);
    obj.edit50:setType("number");
    obj.edit50:setMin(0);
    obj.edit50:setField("historicoValor1_3");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout23);
    obj.edit51:setLeft(200);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(30);
    obj.edit51:setHeight(25);
    obj.edit51:setType("number");
    obj.edit51:setMin(0);
    obj.edit51:setField("historicoBonus1_3");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout23);
    obj.edit52:setLeft(235);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(30);
    obj.edit52:setHeight(25);
    obj.edit52:setType("number");
    obj.edit52:setMin(0);
    obj.edit52:setField("historicoXp1_3");
    obj.edit52:setName("edit52");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox2);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(105);
    obj.layout24:setWidth(270);
    obj.layout24:setHeight(35);
    obj.layout24:setName("layout24");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout24);
    obj.button25:setLeft(0);
    obj.button25:setTop(0);
    obj.button25:setHeight(15);
    obj.button25:setWidth(15);
    obj.button25:setText("1");
    obj.button25:setName("button25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout24);
    obj.button26:setLeft(0);
    obj.button26:setTop(15);
    obj.button26:setHeight(15);
    obj.button26:setWidth(15);
    obj.button26:setText("2");
    obj.button26:setName("button26");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout24);
    obj.edit53:setLeft(20);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(100);
    obj.edit53:setHeight(25);
    obj.edit53:setField("historicoNome1_4");
    obj.edit53:setName("edit53");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout24);
    obj.rectangle26:setLeft(125);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(35);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("Black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout24);
    obj.label64:setLeft(135);
    obj.label64:setTop(3);
    obj.label64:setWidth(30);
    obj.label64:setHeight(20);
    obj.label64:setField("historicoTotal1_4");
    obj.label64:setName("label64");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout24);
    obj.edit54:setLeft(165);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(30);
    obj.edit54:setHeight(25);
    obj.edit54:setType("number");
    obj.edit54:setMin(0);
    obj.edit54:setField("historicoValor1_4");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout24);
    obj.edit55:setLeft(200);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(30);
    obj.edit55:setHeight(25);
    obj.edit55:setType("number");
    obj.edit55:setMin(0);
    obj.edit55:setField("historicoBonus1_4");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout24);
    obj.edit56:setLeft(235);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(30);
    obj.edit56:setHeight(25);
    obj.edit56:setType("number");
    obj.edit56:setMin(0);
    obj.edit56:setField("historicoXp1_4");
    obj.edit56:setName("edit56");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox2);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(140);
    obj.layout25:setWidth(270);
    obj.layout25:setHeight(35);
    obj.layout25:setName("layout25");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout25);
    obj.button27:setLeft(0);
    obj.button27:setTop(0);
    obj.button27:setHeight(15);
    obj.button27:setWidth(15);
    obj.button27:setText("1");
    obj.button27:setName("button27");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout25);
    obj.button28:setLeft(0);
    obj.button28:setTop(15);
    obj.button28:setHeight(15);
    obj.button28:setWidth(15);
    obj.button28:setText("2");
    obj.button28:setName("button28");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout25);
    obj.edit57:setLeft(20);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(100);
    obj.edit57:setHeight(25);
    obj.edit57:setField("historicoNome1_5");
    obj.edit57:setName("edit57");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout25);
    obj.rectangle27:setLeft(125);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(35);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("Black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout25);
    obj.label65:setLeft(135);
    obj.label65:setTop(3);
    obj.label65:setWidth(30);
    obj.label65:setHeight(20);
    obj.label65:setField("historicoTotal1_5");
    obj.label65:setName("label65");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout25);
    obj.edit58:setLeft(165);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(30);
    obj.edit58:setHeight(25);
    obj.edit58:setType("number");
    obj.edit58:setMin(0);
    obj.edit58:setField("historicoValor1_5");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout25);
    obj.edit59:setLeft(200);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(30);
    obj.edit59:setHeight(25);
    obj.edit59:setType("number");
    obj.edit59:setMin(0);
    obj.edit59:setField("historicoBonus1_5");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout25);
    obj.edit60:setLeft(235);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(30);
    obj.edit60:setHeight(25);
    obj.edit60:setType("number");
    obj.edit60:setMin(0);
    obj.edit60:setField("historicoXp1_5");
    obj.edit60:setName("edit60");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox2);
    obj.layout26:setLeft(5);
    obj.layout26:setTop(175);
    obj.layout26:setWidth(270);
    obj.layout26:setHeight(35);
    obj.layout26:setName("layout26");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout26);
    obj.button29:setLeft(0);
    obj.button29:setTop(0);
    obj.button29:setHeight(15);
    obj.button29:setWidth(15);
    obj.button29:setText("1");
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout26);
    obj.button30:setLeft(0);
    obj.button30:setTop(15);
    obj.button30:setHeight(15);
    obj.button30:setWidth(15);
    obj.button30:setText("2");
    obj.button30:setName("button30");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout26);
    obj.edit61:setLeft(20);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(100);
    obj.edit61:setHeight(25);
    obj.edit61:setField("historicoNome1_6");
    obj.edit61:setName("edit61");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout26);
    obj.rectangle28:setLeft(125);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(35);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("Black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout26);
    obj.label66:setLeft(135);
    obj.label66:setTop(3);
    obj.label66:setWidth(30);
    obj.label66:setHeight(20);
    obj.label66:setField("historicoTotal1_6");
    obj.label66:setName("label66");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout26);
    obj.edit62:setLeft(165);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(25);
    obj.edit62:setType("number");
    obj.edit62:setMin(0);
    obj.edit62:setField("historicoValor1_6");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout26);
    obj.edit63:setLeft(200);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(30);
    obj.edit63:setHeight(25);
    obj.edit63:setType("number");
    obj.edit63:setMin(0);
    obj.edit63:setField("historicoBonus1_6");
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout26);
    obj.edit64:setLeft(235);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(30);
    obj.edit64:setHeight(25);
    obj.edit64:setType("number");
    obj.edit64:setMin(0);
    obj.edit64:setField("historicoXp1_6");
    obj.edit64:setName("edit64");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox2);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(210);
    obj.layout27:setWidth(270);
    obj.layout27:setHeight(35);
    obj.layout27:setName("layout27");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout27);
    obj.button31:setLeft(0);
    obj.button31:setTop(0);
    obj.button31:setHeight(15);
    obj.button31:setWidth(15);
    obj.button31:setText("1");
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout27);
    obj.button32:setLeft(0);
    obj.button32:setTop(15);
    obj.button32:setHeight(15);
    obj.button32:setWidth(15);
    obj.button32:setText("2");
    obj.button32:setName("button32");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout27);
    obj.edit65:setLeft(20);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(100);
    obj.edit65:setHeight(25);
    obj.edit65:setField("historicoNome2_1");
    obj.edit65:setName("edit65");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout27);
    obj.rectangle29:setLeft(125);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(35);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("Black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout27);
    obj.label67:setLeft(135);
    obj.label67:setTop(3);
    obj.label67:setWidth(30);
    obj.label67:setHeight(20);
    obj.label67:setField("historicoTotal2_1");
    obj.label67:setName("label67");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout27);
    obj.edit66:setLeft(165);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(30);
    obj.edit66:setHeight(25);
    obj.edit66:setType("number");
    obj.edit66:setMin(0);
    obj.edit66:setField("historicoValor2_1");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout27);
    obj.edit67:setLeft(200);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(30);
    obj.edit67:setHeight(25);
    obj.edit67:setType("number");
    obj.edit67:setMin(0);
    obj.edit67:setField("historicoBonus2_1");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout27);
    obj.edit68:setLeft(235);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(30);
    obj.edit68:setHeight(25);
    obj.edit68:setType("number");
    obj.edit68:setMin(0);
    obj.edit68:setField("historicoXp2_1");
    obj.edit68:setName("edit68");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox2);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(245);
    obj.layout28:setWidth(270);
    obj.layout28:setHeight(35);
    obj.layout28:setName("layout28");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout28);
    obj.button33:setLeft(0);
    obj.button33:setTop(0);
    obj.button33:setHeight(15);
    obj.button33:setWidth(15);
    obj.button33:setText("1");
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout28);
    obj.button34:setLeft(0);
    obj.button34:setTop(15);
    obj.button34:setHeight(15);
    obj.button34:setWidth(15);
    obj.button34:setText("2");
    obj.button34:setName("button34");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout28);
    obj.edit69:setLeft(20);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(100);
    obj.edit69:setHeight(25);
    obj.edit69:setField("historicoNome2_2");
    obj.edit69:setName("edit69");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout28);
    obj.rectangle30:setLeft(125);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(35);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("Black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout28);
    obj.label68:setLeft(135);
    obj.label68:setTop(3);
    obj.label68:setWidth(30);
    obj.label68:setHeight(20);
    obj.label68:setField("historicoTotal2_2");
    obj.label68:setName("label68");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout28);
    obj.edit70:setLeft(165);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(30);
    obj.edit70:setHeight(25);
    obj.edit70:setType("number");
    obj.edit70:setMin(0);
    obj.edit70:setField("historicoValor2_2");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout28);
    obj.edit71:setLeft(200);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(30);
    obj.edit71:setHeight(25);
    obj.edit71:setType("number");
    obj.edit71:setMin(0);
    obj.edit71:setField("historicoBonus2_2");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout28);
    obj.edit72:setLeft(235);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(30);
    obj.edit72:setHeight(25);
    obj.edit72:setType("number");
    obj.edit72:setMin(0);
    obj.edit72:setField("historicoXp2_2");
    obj.edit72:setName("edit72");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox2);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(280);
    obj.layout29:setWidth(270);
    obj.layout29:setHeight(35);
    obj.layout29:setName("layout29");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout29);
    obj.button35:setLeft(0);
    obj.button35:setTop(0);
    obj.button35:setHeight(15);
    obj.button35:setWidth(15);
    obj.button35:setText("1");
    obj.button35:setName("button35");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout29);
    obj.button36:setLeft(0);
    obj.button36:setTop(15);
    obj.button36:setHeight(15);
    obj.button36:setWidth(15);
    obj.button36:setText("2");
    obj.button36:setName("button36");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout29);
    obj.edit73:setLeft(20);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(100);
    obj.edit73:setHeight(25);
    obj.edit73:setField("historicoNome2_3");
    obj.edit73:setName("edit73");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout29);
    obj.rectangle31:setLeft(125);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(35);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("Black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout29);
    obj.label69:setLeft(135);
    obj.label69:setTop(3);
    obj.label69:setWidth(30);
    obj.label69:setHeight(20);
    obj.label69:setField("historicoTotal2_3");
    obj.label69:setName("label69");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout29);
    obj.edit74:setLeft(165);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(30);
    obj.edit74:setHeight(25);
    obj.edit74:setType("number");
    obj.edit74:setMin(0);
    obj.edit74:setField("historicoValor2_3");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout29);
    obj.edit75:setLeft(200);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(30);
    obj.edit75:setHeight(25);
    obj.edit75:setType("number");
    obj.edit75:setMin(0);
    obj.edit75:setField("historicoBonus2_3");
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout29);
    obj.edit76:setLeft(235);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(30);
    obj.edit76:setHeight(25);
    obj.edit76:setType("number");
    obj.edit76:setMin(0);
    obj.edit76:setField("historicoXp2_3");
    obj.edit76:setName("edit76");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox2);
    obj.layout30:setLeft(5);
    obj.layout30:setTop(315);
    obj.layout30:setWidth(270);
    obj.layout30:setHeight(35);
    obj.layout30:setName("layout30");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout30);
    obj.button37:setLeft(0);
    obj.button37:setTop(0);
    obj.button37:setHeight(15);
    obj.button37:setWidth(15);
    obj.button37:setText("1");
    obj.button37:setName("button37");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout30);
    obj.button38:setLeft(0);
    obj.button38:setTop(15);
    obj.button38:setHeight(15);
    obj.button38:setWidth(15);
    obj.button38:setText("2");
    obj.button38:setName("button38");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout30);
    obj.edit77:setLeft(20);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(100);
    obj.edit77:setHeight(25);
    obj.edit77:setField("historicoNome2_4");
    obj.edit77:setName("edit77");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout30);
    obj.rectangle32:setLeft(125);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(35);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("Black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout30);
    obj.label70:setLeft(135);
    obj.label70:setTop(3);
    obj.label70:setWidth(30);
    obj.label70:setHeight(20);
    obj.label70:setField("historicoTotal2_4");
    obj.label70:setName("label70");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout30);
    obj.edit78:setLeft(165);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(30);
    obj.edit78:setHeight(25);
    obj.edit78:setType("number");
    obj.edit78:setMin(0);
    obj.edit78:setField("historicoValor2_4");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout30);
    obj.edit79:setLeft(200);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(30);
    obj.edit79:setHeight(25);
    obj.edit79:setType("number");
    obj.edit79:setMin(0);
    obj.edit79:setField("historicoBonus2_4");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout30);
    obj.edit80:setLeft(235);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(30);
    obj.edit80:setHeight(25);
    obj.edit80:setType("number");
    obj.edit80:setMin(0);
    obj.edit80:setField("historicoXp2_4");
    obj.edit80:setName("edit80");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox2);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(350);
    obj.layout31:setWidth(270);
    obj.layout31:setHeight(35);
    obj.layout31:setName("layout31");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout31);
    obj.button39:setLeft(0);
    obj.button39:setTop(0);
    obj.button39:setHeight(15);
    obj.button39:setWidth(15);
    obj.button39:setText("1");
    obj.button39:setName("button39");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout31);
    obj.button40:setLeft(0);
    obj.button40:setTop(15);
    obj.button40:setHeight(15);
    obj.button40:setWidth(15);
    obj.button40:setText("2");
    obj.button40:setName("button40");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout31);
    obj.edit81:setLeft(20);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(100);
    obj.edit81:setHeight(25);
    obj.edit81:setField("historicoNome2_5");
    obj.edit81:setName("edit81");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout31);
    obj.rectangle33:setLeft(125);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(35);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("Black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout31);
    obj.label71:setLeft(135);
    obj.label71:setTop(3);
    obj.label71:setWidth(30);
    obj.label71:setHeight(20);
    obj.label71:setField("historicoTotal2_5");
    obj.label71:setName("label71");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout31);
    obj.edit82:setLeft(165);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(30);
    obj.edit82:setHeight(25);
    obj.edit82:setType("number");
    obj.edit82:setMin(0);
    obj.edit82:setField("historicoValor2_5");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout31);
    obj.edit83:setLeft(200);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(30);
    obj.edit83:setHeight(25);
    obj.edit83:setType("number");
    obj.edit83:setMin(0);
    obj.edit83:setField("historicoBonus2_5");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout31);
    obj.edit84:setLeft(235);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(30);
    obj.edit84:setHeight(25);
    obj.edit84:setType("number");
    obj.edit84:setMin(0);
    obj.edit84:setField("historicoXp2_5");
    obj.edit84:setName("edit84");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox2);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(385);
    obj.layout32:setWidth(270);
    obj.layout32:setHeight(35);
    obj.layout32:setName("layout32");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout32);
    obj.button41:setLeft(0);
    obj.button41:setTop(0);
    obj.button41:setHeight(15);
    obj.button41:setWidth(15);
    obj.button41:setText("1");
    obj.button41:setName("button41");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout32);
    obj.button42:setLeft(0);
    obj.button42:setTop(15);
    obj.button42:setHeight(15);
    obj.button42:setWidth(15);
    obj.button42:setText("2");
    obj.button42:setName("button42");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout32);
    obj.edit85:setLeft(20);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(100);
    obj.edit85:setHeight(25);
    obj.edit85:setField("historicoNome2_6");
    obj.edit85:setName("edit85");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout32);
    obj.rectangle34:setLeft(125);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(35);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("Black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout32);
    obj.label72:setLeft(135);
    obj.label72:setTop(3);
    obj.label72:setWidth(30);
    obj.label72:setHeight(20);
    obj.label72:setField("historicoTotal2_6");
    obj.label72:setName("label72");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout32);
    obj.edit86:setLeft(165);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(30);
    obj.edit86:setHeight(25);
    obj.edit86:setType("number");
    obj.edit86:setMin(0);
    obj.edit86:setField("historicoValor2_6");
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout32);
    obj.edit87:setLeft(200);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(30);
    obj.edit87:setHeight(25);
    obj.edit87:setType("number");
    obj.edit87:setMin(0);
    obj.edit87:setField("historicoBonus2_6");
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout32);
    obj.edit88:setLeft(235);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(30);
    obj.edit88:setHeight(25);
    obj.edit88:setType("number");
    obj.edit88:setMin(0);
    obj.edit88:setField("historicoXp2_6");
    obj.edit88:setName("edit88");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox2);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(420);
    obj.layout33:setWidth(270);
    obj.layout33:setHeight(35);
    obj.layout33:setName("layout33");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout33);
    obj.button43:setLeft(0);
    obj.button43:setTop(0);
    obj.button43:setHeight(15);
    obj.button43:setWidth(15);
    obj.button43:setText("1");
    obj.button43:setName("button43");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout33);
    obj.button44:setLeft(0);
    obj.button44:setTop(15);
    obj.button44:setHeight(15);
    obj.button44:setWidth(15);
    obj.button44:setText("2");
    obj.button44:setName("button44");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout33);
    obj.edit89:setLeft(20);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(100);
    obj.edit89:setHeight(25);
    obj.edit89:setField("historicoNome3_1");
    obj.edit89:setName("edit89");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout33);
    obj.rectangle35:setLeft(125);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(35);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("Black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout33);
    obj.label73:setLeft(135);
    obj.label73:setTop(3);
    obj.label73:setWidth(30);
    obj.label73:setHeight(20);
    obj.label73:setField("historicoTotal3_1");
    obj.label73:setName("label73");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout33);
    obj.edit90:setLeft(165);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(30);
    obj.edit90:setHeight(25);
    obj.edit90:setType("number");
    obj.edit90:setMin(0);
    obj.edit90:setField("historicoValor3_1");
    obj.edit90:setName("edit90");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout33);
    obj.edit91:setLeft(200);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(30);
    obj.edit91:setHeight(25);
    obj.edit91:setType("number");
    obj.edit91:setMin(0);
    obj.edit91:setField("historicoBonus3_1");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout33);
    obj.edit92:setLeft(235);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(30);
    obj.edit92:setHeight(25);
    obj.edit92:setType("number");
    obj.edit92:setMin(0);
    obj.edit92:setField("historicoXp3_1");
    obj.edit92:setName("edit92");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox2);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(455);
    obj.layout34:setWidth(270);
    obj.layout34:setHeight(35);
    obj.layout34:setName("layout34");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout34);
    obj.button45:setLeft(0);
    obj.button45:setTop(0);
    obj.button45:setHeight(15);
    obj.button45:setWidth(15);
    obj.button45:setText("1");
    obj.button45:setName("button45");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout34);
    obj.button46:setLeft(0);
    obj.button46:setTop(15);
    obj.button46:setHeight(15);
    obj.button46:setWidth(15);
    obj.button46:setText("2");
    obj.button46:setName("button46");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout34);
    obj.edit93:setLeft(20);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(100);
    obj.edit93:setHeight(25);
    obj.edit93:setField("historicoNome3_2");
    obj.edit93:setName("edit93");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout34);
    obj.rectangle36:setLeft(125);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(35);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("Black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout34);
    obj.label74:setLeft(135);
    obj.label74:setTop(3);
    obj.label74:setWidth(30);
    obj.label74:setHeight(20);
    obj.label74:setField("historicoTotal3_2");
    obj.label74:setName("label74");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout34);
    obj.edit94:setLeft(165);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(30);
    obj.edit94:setHeight(25);
    obj.edit94:setType("number");
    obj.edit94:setMin(0);
    obj.edit94:setField("historicoValor3_2");
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout34);
    obj.edit95:setLeft(200);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(30);
    obj.edit95:setHeight(25);
    obj.edit95:setType("number");
    obj.edit95:setMin(0);
    obj.edit95:setField("historicoBonus3_2");
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout34);
    obj.edit96:setLeft(235);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(30);
    obj.edit96:setHeight(25);
    obj.edit96:setType("number");
    obj.edit96:setMin(0);
    obj.edit96:setField("historicoXp3_2");
    obj.edit96:setName("edit96");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox2);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(490);
    obj.layout35:setWidth(270);
    obj.layout35:setHeight(35);
    obj.layout35:setName("layout35");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout35);
    obj.button47:setLeft(0);
    obj.button47:setTop(0);
    obj.button47:setHeight(15);
    obj.button47:setWidth(15);
    obj.button47:setText("1");
    obj.button47:setName("button47");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout35);
    obj.button48:setLeft(0);
    obj.button48:setTop(15);
    obj.button48:setHeight(15);
    obj.button48:setWidth(15);
    obj.button48:setText("2");
    obj.button48:setName("button48");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout35);
    obj.edit97:setLeft(20);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(100);
    obj.edit97:setHeight(25);
    obj.edit97:setField("historicoNome3_3");
    obj.edit97:setName("edit97");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout35);
    obj.rectangle37:setLeft(125);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(35);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("Black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout35);
    obj.label75:setLeft(135);
    obj.label75:setTop(3);
    obj.label75:setWidth(30);
    obj.label75:setHeight(20);
    obj.label75:setField("historicoTotal3_3");
    obj.label75:setName("label75");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout35);
    obj.edit98:setLeft(165);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(30);
    obj.edit98:setHeight(25);
    obj.edit98:setType("number");
    obj.edit98:setMin(0);
    obj.edit98:setField("historicoValor3_3");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout35);
    obj.edit99:setLeft(200);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(30);
    obj.edit99:setHeight(25);
    obj.edit99:setType("number");
    obj.edit99:setMin(0);
    obj.edit99:setField("historicoBonus3_3");
    obj.edit99:setName("edit99");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout35);
    obj.edit100:setLeft(235);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(30);
    obj.edit100:setHeight(25);
    obj.edit100:setType("number");
    obj.edit100:setMin(0);
    obj.edit100:setField("historicoXp3_3");
    obj.edit100:setName("edit100");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox2);
    obj.layout36:setLeft(5);
    obj.layout36:setTop(525);
    obj.layout36:setWidth(270);
    obj.layout36:setHeight(35);
    obj.layout36:setName("layout36");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout36);
    obj.button49:setLeft(0);
    obj.button49:setTop(0);
    obj.button49:setHeight(15);
    obj.button49:setWidth(15);
    obj.button49:setText("1");
    obj.button49:setName("button49");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout36);
    obj.button50:setLeft(0);
    obj.button50:setTop(15);
    obj.button50:setHeight(15);
    obj.button50:setWidth(15);
    obj.button50:setText("2");
    obj.button50:setName("button50");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout36);
    obj.edit101:setLeft(20);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(100);
    obj.edit101:setHeight(25);
    obj.edit101:setField("historicoNome3_4");
    obj.edit101:setName("edit101");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout36);
    obj.rectangle38:setLeft(125);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(35);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout36);
    obj.label76:setLeft(135);
    obj.label76:setTop(3);
    obj.label76:setWidth(30);
    obj.label76:setHeight(20);
    obj.label76:setField("historicoTotal3_4");
    obj.label76:setName("label76");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout36);
    obj.edit102:setLeft(165);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(30);
    obj.edit102:setHeight(25);
    obj.edit102:setType("number");
    obj.edit102:setMin(0);
    obj.edit102:setField("historicoValor3_4");
    obj.edit102:setName("edit102");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout36);
    obj.edit103:setLeft(200);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(30);
    obj.edit103:setHeight(25);
    obj.edit103:setType("number");
    obj.edit103:setMin(0);
    obj.edit103:setField("historicoBonus3_4");
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout36);
    obj.edit104:setLeft(235);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(30);
    obj.edit104:setHeight(25);
    obj.edit104:setType("number");
    obj.edit104:setMin(0);
    obj.edit104:setField("historicoXp3_4");
    obj.edit104:setName("edit104");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox2);
    obj.layout37:setLeft(5);
    obj.layout37:setTop(560);
    obj.layout37:setWidth(270);
    obj.layout37:setHeight(35);
    obj.layout37:setName("layout37");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout37);
    obj.button51:setLeft(0);
    obj.button51:setTop(0);
    obj.button51:setHeight(15);
    obj.button51:setWidth(15);
    obj.button51:setText("1");
    obj.button51:setName("button51");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout37);
    obj.button52:setLeft(0);
    obj.button52:setTop(15);
    obj.button52:setHeight(15);
    obj.button52:setWidth(15);
    obj.button52:setText("2");
    obj.button52:setName("button52");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout37);
    obj.edit105:setLeft(20);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(100);
    obj.edit105:setHeight(25);
    obj.edit105:setField("historicoNome3_5");
    obj.edit105:setName("edit105");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout37);
    obj.rectangle39:setLeft(125);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(35);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("Black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout37);
    obj.label77:setLeft(135);
    obj.label77:setTop(3);
    obj.label77:setWidth(30);
    obj.label77:setHeight(20);
    obj.label77:setField("historicoTotal3_5");
    obj.label77:setName("label77");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout37);
    obj.edit106:setLeft(165);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(30);
    obj.edit106:setHeight(25);
    obj.edit106:setType("number");
    obj.edit106:setMin(0);
    obj.edit106:setField("historicoValor3_5");
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout37);
    obj.edit107:setLeft(200);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(30);
    obj.edit107:setHeight(25);
    obj.edit107:setType("number");
    obj.edit107:setMin(0);
    obj.edit107:setField("historicoBonus3_5");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout37);
    obj.edit108:setLeft(235);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(30);
    obj.edit108:setHeight(25);
    obj.edit108:setType("number");
    obj.edit108:setMin(0);
    obj.edit108:setField("historicoXp3_5");
    obj.edit108:setName("edit108");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox2);
    obj.layout38:setLeft(5);
    obj.layout38:setTop(595);
    obj.layout38:setWidth(270);
    obj.layout38:setHeight(35);
    obj.layout38:setName("layout38");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout38);
    obj.button53:setLeft(0);
    obj.button53:setTop(0);
    obj.button53:setHeight(15);
    obj.button53:setWidth(15);
    obj.button53:setText("1");
    obj.button53:setName("button53");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout38);
    obj.button54:setLeft(0);
    obj.button54:setTop(15);
    obj.button54:setHeight(15);
    obj.button54:setWidth(15);
    obj.button54:setText("2");
    obj.button54:setName("button54");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout38);
    obj.edit109:setLeft(20);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(100);
    obj.edit109:setHeight(25);
    obj.edit109:setField("historicoNome3_6");
    obj.edit109:setName("edit109");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout38);
    obj.rectangle40:setLeft(125);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(35);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("Black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout38);
    obj.label78:setLeft(135);
    obj.label78:setTop(3);
    obj.label78:setWidth(30);
    obj.label78:setHeight(20);
    obj.label78:setField("historicoTotal3_6");
    obj.label78:setName("label78");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout38);
    obj.edit110:setLeft(165);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(30);
    obj.edit110:setHeight(25);
    obj.edit110:setType("number");
    obj.edit110:setMin(0);
    obj.edit110:setField("historicoValor3_6");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout38);
    obj.edit111:setLeft(200);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(30);
    obj.edit111:setHeight(25);
    obj.edit111:setType("number");
    obj.edit111:setMin(0);
    obj.edit111:setField("historicoBonus3_6");
    obj.edit111:setName("edit111");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout38);
    obj.edit112:setLeft(235);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(30);
    obj.edit112:setHeight(25);
    obj.edit112:setType("number");
    obj.edit112:setMin(0);
    obj.edit112:setField("historicoXp3_6");
    obj.edit112:setName("edit112");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox1);
    obj.layout39:setLeft(320);
    obj.layout39:setTop(400);
    obj.layout39:setWidth(300);
    obj.layout39:setHeight(180);
    obj.layout39:setName("layout39");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout39);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setXradius(15);
    obj.rectangle41:setYradius(15);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout39);
    obj.label79:setLeft(0);
    obj.label79:setTop(5);
    obj.label79:setWidth(300);
    obj.label79:setHeight(20);
    obj.label79:setText("OUTROS");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout39);
    obj.button55:setText("+");
    obj.button55:setLeft(100);
    obj.button55:setTop(5);
    obj.button55:setWidth(20);
    obj.button55:setHeight(20);
    obj.button55:setName("button55");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout39);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(20);
    obj.scrollBox3:setWidth(295);
    obj.scrollBox3:setHeight(160);
    obj.scrollBox3:setName("scrollBox3");

    obj.rclListaOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaOutros:setParent(obj.scrollBox3);
    obj.rclListaOutros:setName("rclListaOutros");
    obj.rclListaOutros:setField("campoDosOutros");
    obj.rclListaOutros:setTemplateForm("frmOther");
    obj.rclListaOutros:setAlign("client");
    obj.rclListaOutros:setMargins({left=5,right=5,top=5,bottom=5});
    obj.rclListaOutros:setLayout("vertical");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox1);
    obj.layout40:setLeft(625);
    obj.layout40:setTop(75);
    obj.layout40:setWidth(210);
    obj.layout40:setHeight(450);
    obj.layout40:setName("layout40");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout40);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setXradius(15);
    obj.rectangle42:setYradius(15);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout40);
    obj.label80:setLeft(5);
    obj.label80:setTop(0);
    obj.label80:setWidth(210);
    obj.label80:setHeight(20);
    obj.label80:setText("SAÚDE");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout40);
    obj.horzLine3:setLeft(0);
    obj.horzLine3:setTop(25);
    obj.horzLine3:setWidth(210);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setLeft(0);
    obj.layout41:setTop(30);
    obj.layout41:setWidth(210);
    obj.layout41:setHeight(60);
    obj.layout41:setName("layout41");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout41);
    obj.label81:setLeft(10);
    obj.label81:setTop(0);
    obj.label81:setWidth(95);
    obj.label81:setHeight(20);
    obj.label81:setText("LEVE");
    obj.label81:setName("label81");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.layout41);
    obj.flowLayout2:setLeft(100);
    obj.flowLayout2:setTop(0);
    obj.flowLayout2:setHeight(100);
    obj.flowLayout2:setWidth(60);
    obj.flowLayout2:setName("flowLayout2");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowLayout2);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("check1_1_1");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowLayout2);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setField("check2_1_1");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowLayout2);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setField("check3_1_1");
    obj.checkBox3:setName("checkBox3");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowLayout2);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setField("check1_2_1");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowLayout2);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setField("check2_2_1");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowLayout2);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setField("check3_2_1");
    obj.checkBox6:setName("checkBox6");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout2);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowLayout2);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setField("check1_3_1");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowLayout2);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setField("check2_3_1");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowLayout2);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setField("check3_3_1");
    obj.checkBox9:setName("checkBox9");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout2);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout41);
    obj.edit113:setLeft(170);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(30);
    obj.edit113:setHeight(25);
    obj.edit113:setField("penalidade1");
    obj.edit113:setName("edit113");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout41);
    obj.dataLink19:setField("penalidade1");
    obj.dataLink19:setDefaultValue("0");
    obj.dataLink19:setName("dataLink19");


				local function isAny1()
					local mod = sheet.check1_1_1 or sheet.check2_1_1 or sheet.check3_1_1;
					local quantidade = tonumber(3);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_1 or sheet.check2_2_1 or sheet.check3_2_1;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_1 or sheet.check2_3_1 or sheet.check3_3_1;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_1 or sheet.check2_4_1 or sheet.check3_4_1;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_1 or sheet.check2_5_1 or sheet.check3_5_1;
					end;
					return mod;
				end;
			


    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout40);
    obj.horzLine4:setLeft(0);
    obj.horzLine4:setTop(95);
    obj.horzLine4:setWidth(210);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setName("horzLine4");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(100);
    obj.layout42:setWidth(210);
    obj.layout42:setHeight(40);
    obj.layout42:setName("layout42");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout42);
    obj.label82:setLeft(10);
    obj.label82:setTop(0);
    obj.label82:setWidth(95);
    obj.label82:setHeight(20);
    obj.label82:setText("MEDIO");
    obj.label82:setName("label82");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.layout42);
    obj.flowLayout3:setLeft(100);
    obj.flowLayout3:setTop(0);
    obj.flowLayout3:setHeight(100);
    obj.flowLayout3:setWidth(60);
    obj.flowLayout3:setName("flowLayout3");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowLayout3);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setField("check1_1_2");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowLayout3);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setWidth(20);
    obj.checkBox11:setField("check2_1_2");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowLayout3);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setWidth(20);
    obj.checkBox12:setField("check3_1_2");
    obj.checkBox12:setName("checkBox12");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout3);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowLayout3);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setWidth(20);
    obj.checkBox13:setField("check1_2_2");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowLayout3);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setWidth(20);
    obj.checkBox14:setField("check2_2_2");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowLayout3);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setWidth(20);
    obj.checkBox15:setField("check3_2_2");
    obj.checkBox15:setName("checkBox15");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout3);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout42);
    obj.edit114:setLeft(170);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(30);
    obj.edit114:setHeight(25);
    obj.edit114:setField("penalidade2");
    obj.edit114:setName("edit114");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout42);
    obj.dataLink20:setField("penalidade2");
    obj.dataLink20:setDefaultValue("0.5");
    obj.dataLink20:setName("dataLink20");


				local function isAny2()
					local mod = sheet.check1_1_2 or sheet.check2_1_2 or sheet.check3_1_2;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_2 or sheet.check2_2_2 or sheet.check3_2_2;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_2 or sheet.check2_3_2 or sheet.check3_3_2;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_2 or sheet.check2_4_2 or sheet.check3_4_2;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_2 or sheet.check2_5_2 or sheet.check3_5_2;
					end;
					return mod;
				end;
			


    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout40);
    obj.horzLine5:setLeft(0);
    obj.horzLine5:setTop(145);
    obj.horzLine5:setWidth(210);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setName("horzLine5");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43:setLeft(0);
    obj.layout43:setTop(150);
    obj.layout43:setWidth(210);
    obj.layout43:setHeight(40);
    obj.layout43:setName("layout43");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout43);
    obj.label83:setLeft(10);
    obj.label83:setTop(0);
    obj.label83:setWidth(95);
    obj.label83:setHeight(20);
    obj.label83:setText("SERIO");
    obj.label83:setName("label83");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.layout43);
    obj.flowLayout4:setLeft(100);
    obj.flowLayout4:setTop(0);
    obj.flowLayout4:setHeight(100);
    obj.flowLayout4:setWidth(60);
    obj.flowLayout4:setName("flowLayout4");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowLayout4);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setWidth(20);
    obj.checkBox16:setField("check1_1_3");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.flowLayout4);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setWidth(20);
    obj.checkBox17:setField("check2_1_3");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.flowLayout4);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(20);
    obj.checkBox18:setField("check3_1_3");
    obj.checkBox18:setName("checkBox18");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout4);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.flowLayout4);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setWidth(20);
    obj.checkBox19:setField("check1_2_3");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.flowLayout4);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setWidth(20);
    obj.checkBox20:setField("check2_2_3");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.flowLayout4);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setWidth(20);
    obj.checkBox21:setField("check3_2_3");
    obj.checkBox21:setName("checkBox21");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout4);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout43);
    obj.edit115:setLeft(170);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(30);
    obj.edit115:setHeight(25);
    obj.edit115:setField("penalidade3");
    obj.edit115:setName("edit115");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout43);
    obj.dataLink21:setField("penalidade3");
    obj.dataLink21:setDefaultValue("1");
    obj.dataLink21:setName("dataLink21");


				local function isAny3()
					local mod = sheet.check1_1_3 or sheet.check2_1_3 or sheet.check3_1_3;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_3 or sheet.check2_2_3 or sheet.check3_2_3;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_3 or sheet.check2_3_3 or sheet.check3_3_3;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_3 or sheet.check2_4_3 or sheet.check3_4_3;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_3 or sheet.check2_5_3 or sheet.check3_5_3;
					end;
					return mod;
				end;
			


    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout40);
    obj.horzLine6:setLeft(0);
    obj.horzLine6:setTop(195);
    obj.horzLine6:setWidth(210);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setName("horzLine6");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setLeft(0);
    obj.layout44:setTop(200);
    obj.layout44:setWidth(210);
    obj.layout44:setHeight(40);
    obj.layout44:setName("layout44");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout44);
    obj.label84:setLeft(10);
    obj.label84:setTop(0);
    obj.label84:setWidth(95);
    obj.label84:setHeight(20);
    obj.label84:setText("GRAVE");
    obj.label84:setName("label84");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.layout44);
    obj.flowLayout5:setLeft(100);
    obj.flowLayout5:setTop(0);
    obj.flowLayout5:setHeight(100);
    obj.flowLayout5:setWidth(60);
    obj.flowLayout5:setName("flowLayout5");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.flowLayout5);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setWidth(20);
    obj.checkBox22:setField("check1_1_4");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.flowLayout5);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setWidth(20);
    obj.checkBox23:setField("check2_1_4");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.flowLayout5);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setWidth(20);
    obj.checkBox24:setField("check3_1_4");
    obj.checkBox24:setName("checkBox24");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout5);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.flowLayout5);
    obj.checkBox25:setAlign("left");
    obj.checkBox25:setWidth(20);
    obj.checkBox25:setField("check1_2_4");
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.flowLayout5);
    obj.checkBox26:setAlign("left");
    obj.checkBox26:setWidth(20);
    obj.checkBox26:setField("check2_2_4");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.flowLayout5);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setWidth(20);
    obj.checkBox27:setField("check3_2_4");
    obj.checkBox27:setName("checkBox27");

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout5);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout44);
    obj.edit116:setLeft(170);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(30);
    obj.edit116:setHeight(25);
    obj.edit116:setField("penalidade4");
    obj.edit116:setName("edit116");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout44);
    obj.dataLink22:setField("penalidade4");
    obj.dataLink22:setDefaultValue("2");
    obj.dataLink22:setName("dataLink22");


				local function isAny4()
					local mod = sheet.check1_1_4 or sheet.check2_1_4 or sheet.check3_1_4;
					local quantidade = tonumber(2);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_4 or sheet.check2_2_4 or sheet.check3_2_4;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_4 or sheet.check2_3_4 or sheet.check3_3_4;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_4 or sheet.check2_4_4 or sheet.check3_4_4;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_4 or sheet.check2_5_4 or sheet.check3_5_4;
					end;
					return mod;
				end;
			


    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout40);
    obj.horzLine7:setLeft(0);
    obj.horzLine7:setTop(245);
    obj.horzLine7:setWidth(210);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setName("horzLine7");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout40);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(250);
    obj.layout45:setWidth(210);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout45);
    obj.label85:setLeft(10);
    obj.label85:setTop(0);
    obj.label85:setWidth(95);
    obj.label85:setHeight(20);
    obj.label85:setText("INCAPACITADO");
    obj.label85:setName("label85");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.layout45);
    obj.flowLayout6:setLeft(100);
    obj.flowLayout6:setTop(0);
    obj.flowLayout6:setHeight(100);
    obj.flowLayout6:setWidth(60);
    obj.flowLayout6:setName("flowLayout6");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.flowLayout6);
    obj.checkBox28:setAlign("left");
    obj.checkBox28:setWidth(20);
    obj.checkBox28:setField("check1_1_5");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.flowLayout6);
    obj.checkBox29:setAlign("left");
    obj.checkBox29:setWidth(20);
    obj.checkBox29:setField("check2_1_5");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.flowLayout6);
    obj.checkBox30:setAlign("left");
    obj.checkBox30:setWidth(20);
    obj.checkBox30:setField("check3_1_5");
    obj.checkBox30:setName("checkBox30");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout6);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout45);
    obj.edit117:setLeft(170);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(30);
    obj.edit117:setHeight(25);
    obj.edit117:setField("penalidade5");
    obj.edit117:setName("edit117");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout45);
    obj.dataLink23:setField("penalidade5");
    obj.dataLink23:setDefaultValue("4");
    obj.dataLink23:setName("dataLink23");


				local function isAny5()
					local mod = sheet.check1_1_5 or sheet.check2_1_5 or sheet.check3_1_5;
					local quantidade = tonumber(1);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_5 or sheet.check2_2_5 or sheet.check3_2_5;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_5 or sheet.check2_3_5 or sheet.check3_3_5;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_5 or sheet.check2_4_5 or sheet.check3_4_5;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_5 or sheet.check2_5_5 or sheet.check3_5_5;
					end;
					return mod;
				end;
			


    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout40);
    obj.horzLine8:setLeft(0);
    obj.horzLine8:setTop(280);
    obj.horzLine8:setWidth(210);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setName("horzLine8");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout40);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(285);
    obj.layout46:setWidth(210);
    obj.layout46:setHeight(100);
    obj.layout46:setName("layout46");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout46);
    obj.label86:setLeft(10);
    obj.label86:setTop(0);
    obj.label86:setWidth(95);
    obj.label86:setHeight(20);
    obj.label86:setText("INCOSCIENTE");
    obj.label86:setName("label86");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.layout46);
    obj.flowLayout7:setLeft(100);
    obj.flowLayout7:setTop(0);
    obj.flowLayout7:setHeight(100);
    obj.flowLayout7:setWidth(60);
    obj.flowLayout7:setName("flowLayout7");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.flowLayout7);
    obj.checkBox31:setAlign("left");
    obj.checkBox31:setWidth(20);
    obj.checkBox31:setField("check1_1_6");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.flowLayout7);
    obj.checkBox32:setAlign("left");
    obj.checkBox32:setWidth(20);
    obj.checkBox32:setField("check2_1_6");
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.flowLayout7);
    obj.checkBox33:setAlign("left");
    obj.checkBox33:setWidth(20);
    obj.checkBox33:setField("check3_1_6");
    obj.checkBox33:setName("checkBox33");

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout7);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.flowLayout7);
    obj.checkBox34:setAlign("left");
    obj.checkBox34:setWidth(20);
    obj.checkBox34:setField("check1_2_6");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.flowLayout7);
    obj.checkBox35:setAlign("left");
    obj.checkBox35:setWidth(20);
    obj.checkBox35:setField("check2_2_6");
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.flowLayout7);
    obj.checkBox36:setAlign("left");
    obj.checkBox36:setWidth(20);
    obj.checkBox36:setField("check3_2_6");
    obj.checkBox36:setName("checkBox36");

    obj.flowLineBreak12 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout7);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.flowLayout7);
    obj.checkBox37:setAlign("left");
    obj.checkBox37:setWidth(20);
    obj.checkBox37:setField("check1_3_6");
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.flowLayout7);
    obj.checkBox38:setAlign("left");
    obj.checkBox38:setWidth(20);
    obj.checkBox38:setField("check2_3_6");
    obj.checkBox38:setName("checkBox38");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.flowLayout7);
    obj.checkBox39:setAlign("left");
    obj.checkBox39:setWidth(20);
    obj.checkBox39:setField("check3_3_6");
    obj.checkBox39:setName("checkBox39");

    obj.flowLineBreak13 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.flowLayout7);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.flowLayout7);
    obj.checkBox40:setAlign("left");
    obj.checkBox40:setWidth(20);
    obj.checkBox40:setField("check1_4_6");
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.flowLayout7);
    obj.checkBox41:setAlign("left");
    obj.checkBox41:setWidth(20);
    obj.checkBox41:setField("check2_4_6");
    obj.checkBox41:setName("checkBox41");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.flowLayout7);
    obj.checkBox42:setAlign("left");
    obj.checkBox42:setWidth(20);
    obj.checkBox42:setField("check3_4_6");
    obj.checkBox42:setName("checkBox42");

    obj.flowLineBreak14 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.flowLayout7);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.flowLayout7);
    obj.checkBox43:setAlign("left");
    obj.checkBox43:setWidth(20);
    obj.checkBox43:setField("check1_5_6");
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.flowLayout7);
    obj.checkBox44:setAlign("left");
    obj.checkBox44:setWidth(20);
    obj.checkBox44:setField("check2_5_6");
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.flowLayout7);
    obj.checkBox45:setAlign("left");
    obj.checkBox45:setWidth(20);
    obj.checkBox45:setField("check3_5_6");
    obj.checkBox45:setName("checkBox45");

    obj.flowLineBreak15 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.flowLayout7);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout46);
    obj.edit118:setLeft(170);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(30);
    obj.edit118:setHeight(25);
    obj.edit118:setField("penalidade6");
    obj.edit118:setName("edit118");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout46);
    obj.dataLink24:setField("penalidade6");
    obj.dataLink24:setDefaultValue("0");
    obj.dataLink24:setName("dataLink24");


				local function isAny6()
					local mod = sheet.check1_1_6 or sheet.check2_1_6 or sheet.check3_1_6;
					local quantidade = tonumber(5);
					if quantidade>=2 then
						mod = mod or sheet.check1_2_6 or sheet.check2_2_6 or sheet.check3_2_6;
					end;
					if quantidade>=3 then
						mod = mod or sheet.check1_3_6 or sheet.check2_3_6 or sheet.check3_3_6;
					end;
					if quantidade>=4 then
						mod = mod or sheet.check1_4_6 or sheet.check2_4_6 or sheet.check3_4_6;	
					end;
					if quantidade>=5 then
						mod = mod or sheet.check1_5_6 or sheet.check2_5_6 or sheet.check3_5_6;
					end;
					return mod;
				end;
			


    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout40);
    obj.horzLine9:setLeft(0);
    obj.horzLine9:setTop(385);
    obj.horzLine9:setWidth(210);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setName("horzLine9");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout40);
    obj.label87:setLeft(5);
    obj.label87:setTop(415);
    obj.label87:setWidth(60);
    obj.label87:setHeight(20);
    obj.label87:setText("Absorção");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout40);
    obj.label88:setLeft(65);
    obj.label88:setTop(390);
    obj.label88:setWidth(30);
    obj.label88:setHeight(20);
    obj.label88:setText("Total");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout40);
    obj.rectangle43:setLeft(65);
    obj.rectangle43:setTop(415);
    obj.rectangle43:setWidth(30);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("Black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout40);
    obj.label89:setLeft(65);
    obj.label89:setTop(415);
    obj.label89:setWidth(30);
    obj.label89:setHeight(25);
    obj.label89:setField("absorcao");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout40);
    obj.label90:setLeft(100);
    obj.label90:setTop(390);
    obj.label90:setWidth(30);
    obj.label90:setHeight(20);
    obj.label90:setText(" Res.");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout40);
    obj.rectangle44:setLeft(100);
    obj.rectangle44:setTop(415);
    obj.rectangle44:setWidth(30);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("Black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout40);
    obj.label91:setLeft(100);
    obj.label91:setTop(415);
    obj.label91:setWidth(30);
    obj.label91:setHeight(25);
    obj.label91:setField("absRes");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout40);
    obj.dataLink25:setField("totalresiliencia");
    obj.dataLink25:setName("dataLink25");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout40);
    obj.label92:setLeft(135);
    obj.label92:setTop(390);
    obj.label92:setWidth(30);
    obj.label92:setHeight(20);
    obj.label92:setText("Arm");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout40);
    obj.rectangle45:setLeft(135);
    obj.rectangle45:setTop(415);
    obj.rectangle45:setWidth(30);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("Black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout40);
    obj.label93:setLeft(135);
    obj.label93:setTop(415);
    obj.label93:setWidth(30);
    obj.label93:setHeight(25);
    obj.label93:setField("indiceArmadura");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout40);
    obj.label94:setLeft(170);
    obj.label94:setTop(390);
    obj.label94:setWidth(30);
    obj.label94:setHeight(20);
    obj.label94:setText(" Out.");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout40);
    obj.edit119:setLeft(170);
    obj.edit119:setTop(415);
    obj.edit119:setWidth(30);
    obj.edit119:setHeight(25);
    obj.edit119:setType("number");
    obj.edit119:setField("absOutros");
    obj.edit119:setName("edit119");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout40);
    obj.dataLink26:setFields({'absRes', 'indiceArmadura', 'absOutros'});
    obj.dataLink26:setName("dataLink26");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox1);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(515);
    obj.layout47:setWidth(315);
    obj.layout47:setHeight(70);
    obj.layout47:setName("layout47");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout47);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setXradius(15);
    obj.rectangle46:setYradius(15);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout47);
    obj.button56:setLeft(10);
    obj.button56:setTop(10);
    obj.button56:setWidth(70);
    obj.button56:setHeight(20);
    obj.button56:setText("Iniciativa");
    obj.button56:setName("button56");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout47);
    obj.rectangle47:setLeft(90);
    obj.rectangle47:setTop(10);
    obj.rectangle47:setWidth(35);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("Black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout47);
    obj.label95:setLeft(100);
    obj.label95:setTop(10);
    obj.label95:setWidth(30);
    obj.label95:setHeight(20);
    obj.label95:setField("iniciativa");
    obj.label95:setName("label95");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout47);
    obj.edit120:setLeft(135);
    obj.edit120:setTop(10);
    obj.edit120:setWidth(30);
    obj.edit120:setHeight(25);
    obj.edit120:setType("number");
    obj.edit120:setField("iniciativaBonus");
    obj.edit120:setName("edit120");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout47);
    obj.label96:setLeft(190);
    obj.label96:setTop(10);
    obj.label96:setWidth(100);
    obj.label96:setHeight(20);
    obj.label96:setField("ms");
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout47);
    obj.label97:setLeft(10);
    obj.label97:setTop(40);
    obj.label97:setWidth(90);
    obj.label97:setHeight(20);
    obj.label97:setText("Velocidade");
    obj.label97:setName("label97");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout47);
    obj.rectangle48:setLeft(90);
    obj.rectangle48:setTop(40);
    obj.rectangle48:setWidth(35);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("Black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout47);
    obj.label98:setLeft(100);
    obj.label98:setTop(40);
    obj.label98:setWidth(30);
    obj.label98:setHeight(20);
    obj.label98:setField("velocidade");
    obj.label98:setName("label98");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout47);
    obj.edit121:setLeft(135);
    obj.edit121:setTop(40);
    obj.edit121:setWidth(30);
    obj.edit121:setHeight(25);
    obj.edit121:setType("number");
    obj.edit121:setField("velocidadeBonus");
    obj.edit121:setName("edit121");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout47);
    obj.label99:setLeft(190);
    obj.label99:setTop(40);
    obj.label99:setWidth(100);
    obj.label99:setHeight(20);
    obj.label99:setField("kmh");
    obj.label99:setName("label99");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout47);
    obj.dataLink27:setFields({'totalforca', 'totalagilidade', 'totalperspicacia', 'iniciativaBonus', 'velocidadeBonus'});
    obj.dataLink27:setName("dataLink27");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox1);
    obj.layout48:setLeft(840);
    obj.layout48:setTop(445);
    obj.layout48:setWidth(300);
    obj.layout48:setHeight(80);
    obj.layout48:setName("layout48");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout48);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(5);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout48);
    obj.rectangle50:setLeft(10);
    obj.rectangle50:setTop(30);
    obj.rectangle50:setWidth(35);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("Black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout48);
    obj.label100:setLeft(5);
    obj.label100:setTop(10);
    obj.label100:setWidth(50);
    obj.label100:setHeight(20);
    obj.label100:setText("Dado 1");
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout48);
    obj.label101:setLeft(20);
    obj.label101:setTop(32);
    obj.label101:setWidth(30);
    obj.label101:setHeight(20);
    obj.label101:setField("num1");
    obj.label101:setText("val");
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout48);
    obj.label102:setLeft(46);
    obj.label102:setTop(32);
    obj.label102:setWidth(10);
    obj.label102:setHeight(20);
    obj.label102:setText("+");
    obj.label102:setName("label102");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout48);
    obj.rectangle51:setLeft(55);
    obj.rectangle51:setTop(30);
    obj.rectangle51:setWidth(35);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("Black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout48);
    obj.label103:setLeft(50);
    obj.label103:setTop(10);
    obj.label103:setWidth(50);
    obj.label103:setHeight(20);
    obj.label103:setText("Dado 2");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout48);
    obj.label104:setLeft(65);
    obj.label104:setTop(32);
    obj.label104:setWidth(30);
    obj.label104:setHeight(20);
    obj.label104:setField("num2");
    obj.label104:setText("val");
    obj.label104:setName("label104");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout48);
    obj.button57:setLeft(70);
    obj.button57:setTop(60);
    obj.button57:setWidth(15);
    obj.button57:setHeight(15);
    obj.button57:setText("x");
    obj.button57:setFontSize(10);
    obj.button57:setName("button57");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout48);
    obj.label105:setLeft(105);
    obj.label105:setTop(60);
    obj.label105:setWidth(80);
    obj.label105:setHeight(15);
    obj.label105:setField("rollnome1");
    obj.label105:setFontSize(11);
    obj.label105:setHorzTextAlign("trailing");
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout48);
    obj.label106:setLeft(185);
    obj.label106:setTop(60);
    obj.label106:setWidth(15);
    obj.label106:setHeight(15);
    obj.label106:setText("+");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout48);
    obj.label107:setLeft(200);
    obj.label107:setTop(60);
    obj.label107:setWidth(80);
    obj.label107:setHeight(15);
    obj.label107:setField("rollnome2");
    obj.label107:setFontSize(11);
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout48);
    obj.label108:setLeft(92);
    obj.label108:setTop(32);
    obj.label108:setWidth(10);
    obj.label108:setHeight(20);
    obj.label108:setText("+");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout48);
    obj.label109:setLeft(105);
    obj.label109:setTop(10);
    obj.label109:setWidth(40);
    obj.label109:setHeight(20);
    obj.label109:setText("Especs");
    obj.label109:setName("label109");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout48);
    obj.comboBox1:setLeft(105);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setItems({'0', '1,5', '3'});
    obj.comboBox1:setValues({'0', '1', '2'});
    obj.comboBox1:setValue("0");
    obj.comboBox1:setField("especBonus");
    obj.comboBox1:setName("comboBox1");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout48);
    obj.label110:setLeft(160);
    obj.label110:setTop(10);
    obj.label110:setWidth(40);
    obj.label110:setHeight(20);
    obj.label110:setText("Extra");
    obj.label110:setName("label110");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout48);
    obj.edit122:setLeft(160);
    obj.edit122:setTop(30);
    obj.edit122:setWidth(30);
    obj.edit122:setHeight(25);
    obj.edit122:setField("extra");
    obj.edit122:setName("edit122");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout48);
    obj.label111:setLeft(195);
    obj.label111:setTop(10);
    obj.label111:setWidth(40);
    obj.label111:setHeight(20);
    obj.label111:setText("Dific.");
    obj.label111:setName("label111");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout48);
    obj.edit123:setLeft(195);
    obj.edit123:setTop(30);
    obj.edit123:setWidth(30);
    obj.edit123:setHeight(25);
    obj.edit123:setField("dificuldade");
    obj.edit123:setType("number");
    obj.edit123:setName("edit123");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout48);
    obj.button58:setLeft(230);
    obj.button58:setTop(30);
    obj.button58:setWidth(50);
    obj.button58:setText("ROLAR");
    obj.button58:setFontSize(11);
    obj.button58:setName("button58");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.scrollBox1);
    obj.rectangle52:setLeft(840);
    obj.rectangle52:setTop(90);
    obj.rectangle52:setWidth(350);
    obj.rectangle52:setHeight(350);
    obj.rectangle52:setColor("DimGray");
    obj.rectangle52:setXradius(5);
    obj.rectangle52:setYradius(5);
    obj.rectangle52:setCornerType("innerLine");
    obj.rectangle52:setName("rectangle52");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(840);
    obj.image1:setTop(90);
    obj.image1:setWidth(350);
    obj.image1:setHeight(350);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");



		local function rolar()
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);
			local num1 = (tonumber(sheet.num1) or 0);
			local num2 = (tonumber(sheet.num2) or 0);
            local parada = num1 + num2 + (tonumber(sheet.extra) or 0);
            if sheet.especBonus=='1' then
            	parada = parada + 1.5;
            elseif sheet.especBonus=='2' then
            	parada = parada + 3;
            end;
			local pen = 0;
			if isAny6() then
				pen = tonumber(sheet.penalidade6) or 0;
			elseif isAny5() then
				pen = tonumber(sheet.penalidade5) or 0;
			elseif isAny4() then
				pen = tonumber(sheet.penalidade4) or 0;
			elseif isAny3() then
				pen = tonumber(sheet.penalidade3) or 0;
			elseif isAny2() then
				pen = tonumber(sheet.penalidade2) or 0;
			elseif isAny1() then
				pen = tonumber(sheet.penalidade1) or 0;
			end;
			parada = parada - math.abs(pen);
			
            parada = math.floor(parada);

           	local dificuldade = (tonumber(sheet.dificuldade) or 0);
           	dificuldade = dificuldade;

           	local nome = "";
           	if sheet.rollnome1 ~= nil then 
           		nome = sheet.rollnome1 .. " ";
           	end;
           	if sheet.rollnome2 ~= nil then
           		nome = nome .. "+ " .. sheet.rollnome2 .. " ";
           	end;

           	if parada < 1 then 
           		mesaDoPersonagem.activeChat:enviarMensagem("Sem dados suficientes para essa rolagem. ");
           		return;
           	end;

           	rolagem = rrpg.interpretarRolagem(parada .. "d10");
           	mesaDoPersonagem.activeChat:rolarDados(rolagem, nome .. "Dificuldade: " .. dificuldade  .. " (" .. num1 .. " + " .. num2 .. " + " .. (sheet.especBonus or 0) .. "x especializaçao + " .. (sheet.extra or 0) .. " - " .. pen .. " dano)", 
				function (rolado)
					local sucessos = 0;
					local op = rolado.ops[1];

					for j=1, #op.resultados, 1 do
						if op.resultados[j] >= dificuldade then
					    	sucessos = sucessos +1;
						end;
					end;
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					mesaDoPersonagem.activeChat:enviarMensagem(sucessos .. " Sucesso(s)!");
				end);
		end;
	


    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Aptidões");
    obj.tab2:setName("tab2");

    obj.frmACN2 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN2:setParent(obj.tab2);
    obj.frmACN2:setName("frmACN2");
    obj.frmACN2:setAlign("client");
    obj.frmACN2:setTheme("dark");
    obj.frmACN2:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmACN2);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox4);
    obj.layout49:setLeft(0);
    obj.layout49:setTop(0);
    obj.layout49:setWidth(280);
    obj.layout49:setHeight(630);
    obj.layout49:setName("layout49");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout49);
    obj.rectangle53:setLeft(0);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(280);
    obj.rectangle53:setHeight(630);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(15);
    obj.rectangle53:setYradius(15);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout49);
    obj.label112:setLeft(5);
    obj.label112:setTop(0);
    obj.label112:setWidth(240);
    obj.label112:setHeight(20);
    obj.label112:setText("TALENTOS FISICOS");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout49);
    obj.label113:setLeft(25);
    obj.label113:setTop(25);
    obj.label113:setWidth(315);
    obj.label113:setHeight(20);
    obj.label113:setText(" Nome");
    obj.label113:setName("label113");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout49);
    obj.label114:setLeft(135);
    obj.label114:setTop(25);
    obj.label114:setWidth(315);
    obj.label114:setHeight(20);
    obj.label114:setText("Total");
    obj.label114:setName("label114");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout49);
    obj.label115:setLeft(170);
    obj.label115:setTop(25);
    obj.label115:setWidth(315);
    obj.label115:setHeight(20);
    obj.label115:setText(" Inic");
    obj.label115:setName("label115");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout49);
    obj.label116:setLeft(202);
    obj.label116:setTop(25);
    obj.label116:setWidth(315);
    obj.label116:setHeight(20);
    obj.label116:setText(" Apr.");
    obj.label116:setName("label116");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout49);
    obj.label117:setLeft(235);
    obj.label117:setTop(25);
    obj.label117:setWidth(315);
    obj.label117:setHeight(20);
    obj.label117:setText("  XP");
    obj.label117:setName("label117");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setLeft(5);
    obj.layout50:setTop(50);
    obj.layout50:setWidth(270);
    obj.layout50:setHeight(50);
    obj.layout50:setName("layout50");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout50);
    obj.button59:setLeft(0);
    obj.button59:setTop(0);
    obj.button59:setHeight(15);
    obj.button59:setWidth(15);
    obj.button59:setText("1");
    obj.button59:setName("button59");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout50);
    obj.button60:setLeft(0);
    obj.button60:setTop(15);
    obj.button60:setHeight(15);
    obj.button60:setWidth(15);
    obj.button60:setText("2");
    obj.button60:setName("button60");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout50);
    obj.edit124:setLeft(20);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(100);
    obj.edit124:setHeight(25);
    obj.edit124:setField("nome0_1");
    obj.edit124:setName("edit124");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout50);
    obj.rectangle54:setLeft(125);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(40);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("Black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout50);
    obj.label118:setLeft(125);
    obj.label118:setTop(3);
    obj.label118:setWidth(40);
    obj.label118:setHeight(20);
    obj.label118:setField("total20_1");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout50);
    obj.edit125:setLeft(170);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(30);
    obj.edit125:setHeight(25);
    obj.edit125:setType("number");
    obj.edit125:setMin(0);
    obj.edit125:setField("base0_1");
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout50);
    obj.edit126:setLeft(205);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(30);
    obj.edit126:setHeight(25);
    obj.edit126:setType("number");
    obj.edit126:setMin(0);
    obj.edit126:setField("bonus0_1");
    obj.edit126:setName("edit126");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout50);
    obj.edit127:setLeft(240);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(30);
    obj.edit127:setHeight(25);
    obj.edit127:setType("number");
    obj.edit127:setMin(0);
    obj.edit127:setField("xp0_1");
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout50);
    obj.edit128:setLeft(20);
    obj.edit128:setTop(28);
    obj.edit128:setWidth(250);
    obj.edit128:setHeight(20);
    obj.edit128:setField("espec0_1");
    obj.edit128:setName("edit128");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout49);
    obj.layout51:setLeft(5);
    obj.layout51:setTop(100);
    obj.layout51:setWidth(270);
    obj.layout51:setHeight(50);
    obj.layout51:setName("layout51");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout51);
    obj.button61:setLeft(0);
    obj.button61:setTop(0);
    obj.button61:setHeight(15);
    obj.button61:setWidth(15);
    obj.button61:setText("1");
    obj.button61:setName("button61");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout51);
    obj.button62:setLeft(0);
    obj.button62:setTop(15);
    obj.button62:setHeight(15);
    obj.button62:setWidth(15);
    obj.button62:setText("2");
    obj.button62:setName("button62");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout51);
    obj.edit129:setLeft(20);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(100);
    obj.edit129:setHeight(25);
    obj.edit129:setField("nome0_2");
    obj.edit129:setName("edit129");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout51);
    obj.rectangle55:setLeft(125);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(40);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("Black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout51);
    obj.label119:setLeft(125);
    obj.label119:setTop(3);
    obj.label119:setWidth(40);
    obj.label119:setHeight(20);
    obj.label119:setField("total20_2");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout51);
    obj.edit130:setLeft(170);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(30);
    obj.edit130:setHeight(25);
    obj.edit130:setType("number");
    obj.edit130:setMin(0);
    obj.edit130:setField("base0_2");
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout51);
    obj.edit131:setLeft(205);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(30);
    obj.edit131:setHeight(25);
    obj.edit131:setType("number");
    obj.edit131:setMin(0);
    obj.edit131:setField("bonus0_2");
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout51);
    obj.edit132:setLeft(240);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(30);
    obj.edit132:setHeight(25);
    obj.edit132:setType("number");
    obj.edit132:setMin(0);
    obj.edit132:setField("xp0_2");
    obj.edit132:setName("edit132");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout51);
    obj.edit133:setLeft(20);
    obj.edit133:setTop(28);
    obj.edit133:setWidth(250);
    obj.edit133:setHeight(20);
    obj.edit133:setField("espec0_2");
    obj.edit133:setName("edit133");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout49);
    obj.layout52:setLeft(5);
    obj.layout52:setTop(150);
    obj.layout52:setWidth(270);
    obj.layout52:setHeight(50);
    obj.layout52:setName("layout52");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout52);
    obj.button63:setLeft(0);
    obj.button63:setTop(0);
    obj.button63:setHeight(15);
    obj.button63:setWidth(15);
    obj.button63:setText("1");
    obj.button63:setName("button63");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout52);
    obj.button64:setLeft(0);
    obj.button64:setTop(15);
    obj.button64:setHeight(15);
    obj.button64:setWidth(15);
    obj.button64:setText("2");
    obj.button64:setName("button64");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout52);
    obj.edit134:setLeft(20);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(100);
    obj.edit134:setHeight(25);
    obj.edit134:setField("nome0_3");
    obj.edit134:setName("edit134");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout52);
    obj.rectangle56:setLeft(125);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(40);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("Black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout52);
    obj.label120:setLeft(125);
    obj.label120:setTop(3);
    obj.label120:setWidth(40);
    obj.label120:setHeight(20);
    obj.label120:setField("total20_3");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout52);
    obj.edit135:setLeft(170);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(30);
    obj.edit135:setHeight(25);
    obj.edit135:setType("number");
    obj.edit135:setMin(0);
    obj.edit135:setField("base0_3");
    obj.edit135:setName("edit135");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout52);
    obj.edit136:setLeft(205);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(30);
    obj.edit136:setHeight(25);
    obj.edit136:setType("number");
    obj.edit136:setMin(0);
    obj.edit136:setField("bonus0_3");
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout52);
    obj.edit137:setLeft(240);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(30);
    obj.edit137:setHeight(25);
    obj.edit137:setType("number");
    obj.edit137:setMin(0);
    obj.edit137:setField("xp0_3");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout52);
    obj.edit138:setLeft(20);
    obj.edit138:setTop(28);
    obj.edit138:setWidth(250);
    obj.edit138:setHeight(20);
    obj.edit138:setField("espec0_3");
    obj.edit138:setName("edit138");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout49);
    obj.layout53:setLeft(5);
    obj.layout53:setTop(200);
    obj.layout53:setWidth(270);
    obj.layout53:setHeight(50);
    obj.layout53:setName("layout53");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout53);
    obj.button65:setLeft(0);
    obj.button65:setTop(0);
    obj.button65:setHeight(15);
    obj.button65:setWidth(15);
    obj.button65:setText("1");
    obj.button65:setName("button65");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout53);
    obj.button66:setLeft(0);
    obj.button66:setTop(15);
    obj.button66:setHeight(15);
    obj.button66:setWidth(15);
    obj.button66:setText("2");
    obj.button66:setName("button66");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout53);
    obj.edit139:setLeft(20);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(100);
    obj.edit139:setHeight(25);
    obj.edit139:setField("nome0_4");
    obj.edit139:setName("edit139");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout53);
    obj.rectangle57:setLeft(125);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(40);
    obj.rectangle57:setHeight(25);
    obj.rectangle57:setColor("Black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout53);
    obj.label121:setLeft(125);
    obj.label121:setTop(3);
    obj.label121:setWidth(40);
    obj.label121:setHeight(20);
    obj.label121:setField("total20_4");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout53);
    obj.edit140:setLeft(170);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(30);
    obj.edit140:setHeight(25);
    obj.edit140:setType("number");
    obj.edit140:setMin(0);
    obj.edit140:setField("base0_4");
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout53);
    obj.edit141:setLeft(205);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(30);
    obj.edit141:setHeight(25);
    obj.edit141:setType("number");
    obj.edit141:setMin(0);
    obj.edit141:setField("bonus0_4");
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout53);
    obj.edit142:setLeft(240);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(30);
    obj.edit142:setHeight(25);
    obj.edit142:setType("number");
    obj.edit142:setMin(0);
    obj.edit142:setField("xp0_4");
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout53);
    obj.edit143:setLeft(20);
    obj.edit143:setTop(28);
    obj.edit143:setWidth(250);
    obj.edit143:setHeight(20);
    obj.edit143:setField("espec0_4");
    obj.edit143:setName("edit143");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout49);
    obj.layout54:setLeft(5);
    obj.layout54:setTop(250);
    obj.layout54:setWidth(270);
    obj.layout54:setHeight(50);
    obj.layout54:setName("layout54");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout54);
    obj.button67:setLeft(0);
    obj.button67:setTop(0);
    obj.button67:setHeight(15);
    obj.button67:setWidth(15);
    obj.button67:setText("1");
    obj.button67:setName("button67");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout54);
    obj.button68:setLeft(0);
    obj.button68:setTop(15);
    obj.button68:setHeight(15);
    obj.button68:setWidth(15);
    obj.button68:setText("2");
    obj.button68:setName("button68");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout54);
    obj.edit144:setLeft(20);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(100);
    obj.edit144:setHeight(25);
    obj.edit144:setField("nome0_5");
    obj.edit144:setName("edit144");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout54);
    obj.rectangle58:setLeft(125);
    obj.rectangle58:setTop(0);
    obj.rectangle58:setWidth(40);
    obj.rectangle58:setHeight(25);
    obj.rectangle58:setColor("Black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout54);
    obj.label122:setLeft(125);
    obj.label122:setTop(3);
    obj.label122:setWidth(40);
    obj.label122:setHeight(20);
    obj.label122:setField("total20_5");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout54);
    obj.edit145:setLeft(170);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(30);
    obj.edit145:setHeight(25);
    obj.edit145:setType("number");
    obj.edit145:setMin(0);
    obj.edit145:setField("base0_5");
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout54);
    obj.edit146:setLeft(205);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(30);
    obj.edit146:setHeight(25);
    obj.edit146:setType("number");
    obj.edit146:setMin(0);
    obj.edit146:setField("bonus0_5");
    obj.edit146:setName("edit146");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout54);
    obj.edit147:setLeft(240);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(30);
    obj.edit147:setHeight(25);
    obj.edit147:setType("number");
    obj.edit147:setMin(0);
    obj.edit147:setField("xp0_5");
    obj.edit147:setName("edit147");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout54);
    obj.edit148:setLeft(20);
    obj.edit148:setTop(28);
    obj.edit148:setWidth(250);
    obj.edit148:setHeight(20);
    obj.edit148:setField("espec0_5");
    obj.edit148:setName("edit148");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout49);
    obj.layout55:setLeft(5);
    obj.layout55:setTop(300);
    obj.layout55:setWidth(270);
    obj.layout55:setHeight(50);
    obj.layout55:setName("layout55");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout55);
    obj.button69:setLeft(0);
    obj.button69:setTop(0);
    obj.button69:setHeight(15);
    obj.button69:setWidth(15);
    obj.button69:setText("1");
    obj.button69:setName("button69");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.layout55);
    obj.button70:setLeft(0);
    obj.button70:setTop(15);
    obj.button70:setHeight(15);
    obj.button70:setWidth(15);
    obj.button70:setText("2");
    obj.button70:setName("button70");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout55);
    obj.edit149:setLeft(20);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(100);
    obj.edit149:setHeight(25);
    obj.edit149:setField("nome0_6");
    obj.edit149:setName("edit149");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout55);
    obj.rectangle59:setLeft(125);
    obj.rectangle59:setTop(0);
    obj.rectangle59:setWidth(40);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("Black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout55);
    obj.label123:setLeft(125);
    obj.label123:setTop(3);
    obj.label123:setWidth(40);
    obj.label123:setHeight(20);
    obj.label123:setField("total20_6");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout55);
    obj.edit150:setLeft(170);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(30);
    obj.edit150:setHeight(25);
    obj.edit150:setType("number");
    obj.edit150:setMin(0);
    obj.edit150:setField("base0_6");
    obj.edit150:setName("edit150");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout55);
    obj.edit151:setLeft(205);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(30);
    obj.edit151:setHeight(25);
    obj.edit151:setType("number");
    obj.edit151:setMin(0);
    obj.edit151:setField("bonus0_6");
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout55);
    obj.edit152:setLeft(240);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(30);
    obj.edit152:setHeight(25);
    obj.edit152:setType("number");
    obj.edit152:setMin(0);
    obj.edit152:setField("xp0_6");
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout55);
    obj.edit153:setLeft(20);
    obj.edit153:setTop(28);
    obj.edit153:setWidth(250);
    obj.edit153:setHeight(20);
    obj.edit153:setField("espec0_6");
    obj.edit153:setName("edit153");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout49);
    obj.layout56:setLeft(5);
    obj.layout56:setTop(350);
    obj.layout56:setWidth(270);
    obj.layout56:setHeight(50);
    obj.layout56:setName("layout56");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout56);
    obj.button71:setLeft(0);
    obj.button71:setTop(0);
    obj.button71:setHeight(15);
    obj.button71:setWidth(15);
    obj.button71:setText("1");
    obj.button71:setName("button71");

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.layout56);
    obj.button72:setLeft(0);
    obj.button72:setTop(15);
    obj.button72:setHeight(15);
    obj.button72:setWidth(15);
    obj.button72:setText("2");
    obj.button72:setName("button72");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout56);
    obj.edit154:setLeft(20);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(100);
    obj.edit154:setHeight(25);
    obj.edit154:setField("nome0_7");
    obj.edit154:setName("edit154");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout56);
    obj.rectangle60:setLeft(125);
    obj.rectangle60:setTop(0);
    obj.rectangle60:setWidth(40);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("Black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout56);
    obj.label124:setLeft(125);
    obj.label124:setTop(3);
    obj.label124:setWidth(40);
    obj.label124:setHeight(20);
    obj.label124:setField("total20_7");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout56);
    obj.edit155:setLeft(170);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(30);
    obj.edit155:setHeight(25);
    obj.edit155:setType("number");
    obj.edit155:setMin(0);
    obj.edit155:setField("base0_7");
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout56);
    obj.edit156:setLeft(205);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(30);
    obj.edit156:setHeight(25);
    obj.edit156:setType("number");
    obj.edit156:setMin(0);
    obj.edit156:setField("bonus0_7");
    obj.edit156:setName("edit156");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout56);
    obj.edit157:setLeft(240);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(30);
    obj.edit157:setHeight(25);
    obj.edit157:setType("number");
    obj.edit157:setMin(0);
    obj.edit157:setField("xp0_7");
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout56);
    obj.edit158:setLeft(20);
    obj.edit158:setTop(28);
    obj.edit158:setWidth(250);
    obj.edit158:setHeight(20);
    obj.edit158:setField("espec0_7");
    obj.edit158:setName("edit158");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout49);
    obj.layout57:setLeft(5);
    obj.layout57:setTop(400);
    obj.layout57:setWidth(270);
    obj.layout57:setHeight(50);
    obj.layout57:setName("layout57");

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.layout57);
    obj.button73:setLeft(0);
    obj.button73:setTop(0);
    obj.button73:setHeight(15);
    obj.button73:setWidth(15);
    obj.button73:setText("1");
    obj.button73:setName("button73");

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout57);
    obj.button74:setLeft(0);
    obj.button74:setTop(15);
    obj.button74:setHeight(15);
    obj.button74:setWidth(15);
    obj.button74:setText("2");
    obj.button74:setName("button74");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout57);
    obj.edit159:setLeft(20);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(100);
    obj.edit159:setHeight(25);
    obj.edit159:setField("nome0_8");
    obj.edit159:setName("edit159");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout57);
    obj.rectangle61:setLeft(125);
    obj.rectangle61:setTop(0);
    obj.rectangle61:setWidth(40);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("Black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout57);
    obj.label125:setLeft(125);
    obj.label125:setTop(3);
    obj.label125:setWidth(40);
    obj.label125:setHeight(20);
    obj.label125:setField("total20_8");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout57);
    obj.edit160:setLeft(170);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(30);
    obj.edit160:setHeight(25);
    obj.edit160:setType("number");
    obj.edit160:setMin(0);
    obj.edit160:setField("base0_8");
    obj.edit160:setName("edit160");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout57);
    obj.edit161:setLeft(205);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(30);
    obj.edit161:setHeight(25);
    obj.edit161:setType("number");
    obj.edit161:setMin(0);
    obj.edit161:setField("bonus0_8");
    obj.edit161:setName("edit161");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout57);
    obj.edit162:setLeft(240);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(30);
    obj.edit162:setHeight(25);
    obj.edit162:setType("number");
    obj.edit162:setMin(0);
    obj.edit162:setField("xp0_8");
    obj.edit162:setName("edit162");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout57);
    obj.edit163:setLeft(20);
    obj.edit163:setTop(28);
    obj.edit163:setWidth(250);
    obj.edit163:setHeight(20);
    obj.edit163:setField("espec0_8");
    obj.edit163:setName("edit163");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout49);
    obj.layout58:setLeft(5);
    obj.layout58:setTop(450);
    obj.layout58:setWidth(270);
    obj.layout58:setHeight(50);
    obj.layout58:setName("layout58");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.layout58);
    obj.button75:setLeft(0);
    obj.button75:setTop(0);
    obj.button75:setHeight(15);
    obj.button75:setWidth(15);
    obj.button75:setText("1");
    obj.button75:setName("button75");

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout58);
    obj.button76:setLeft(0);
    obj.button76:setTop(15);
    obj.button76:setHeight(15);
    obj.button76:setWidth(15);
    obj.button76:setText("2");
    obj.button76:setName("button76");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout58);
    obj.edit164:setLeft(20);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(100);
    obj.edit164:setHeight(25);
    obj.edit164:setField("nome0_9");
    obj.edit164:setName("edit164");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout58);
    obj.rectangle62:setLeft(125);
    obj.rectangle62:setTop(0);
    obj.rectangle62:setWidth(40);
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("Black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout58);
    obj.label126:setLeft(125);
    obj.label126:setTop(3);
    obj.label126:setWidth(40);
    obj.label126:setHeight(20);
    obj.label126:setField("total20_9");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout58);
    obj.edit165:setLeft(170);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(30);
    obj.edit165:setHeight(25);
    obj.edit165:setType("number");
    obj.edit165:setMin(0);
    obj.edit165:setField("base0_9");
    obj.edit165:setName("edit165");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout58);
    obj.edit166:setLeft(205);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(30);
    obj.edit166:setHeight(25);
    obj.edit166:setType("number");
    obj.edit166:setMin(0);
    obj.edit166:setField("bonus0_9");
    obj.edit166:setName("edit166");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout58);
    obj.edit167:setLeft(240);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(30);
    obj.edit167:setHeight(25);
    obj.edit167:setType("number");
    obj.edit167:setMin(0);
    obj.edit167:setField("xp0_9");
    obj.edit167:setName("edit167");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout58);
    obj.edit168:setLeft(20);
    obj.edit168:setTop(28);
    obj.edit168:setWidth(250);
    obj.edit168:setHeight(20);
    obj.edit168:setField("espec0_9");
    obj.edit168:setName("edit168");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout49);
    obj.layout59:setLeft(5);
    obj.layout59:setTop(500);
    obj.layout59:setWidth(270);
    obj.layout59:setHeight(50);
    obj.layout59:setName("layout59");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout59);
    obj.button77:setLeft(0);
    obj.button77:setTop(0);
    obj.button77:setHeight(15);
    obj.button77:setWidth(15);
    obj.button77:setText("1");
    obj.button77:setName("button77");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout59);
    obj.button78:setLeft(0);
    obj.button78:setTop(15);
    obj.button78:setHeight(15);
    obj.button78:setWidth(15);
    obj.button78:setText("2");
    obj.button78:setName("button78");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout59);
    obj.edit169:setLeft(20);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(100);
    obj.edit169:setHeight(25);
    obj.edit169:setField("nome0_10");
    obj.edit169:setName("edit169");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout59);
    obj.rectangle63:setLeft(125);
    obj.rectangle63:setTop(0);
    obj.rectangle63:setWidth(40);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("Black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout59);
    obj.label127:setLeft(125);
    obj.label127:setTop(3);
    obj.label127:setWidth(40);
    obj.label127:setHeight(20);
    obj.label127:setField("total20_10");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout59);
    obj.edit170:setLeft(170);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(30);
    obj.edit170:setHeight(25);
    obj.edit170:setType("number");
    obj.edit170:setMin(0);
    obj.edit170:setField("base0_10");
    obj.edit170:setName("edit170");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout59);
    obj.edit171:setLeft(205);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(30);
    obj.edit171:setHeight(25);
    obj.edit171:setType("number");
    obj.edit171:setMin(0);
    obj.edit171:setField("bonus0_10");
    obj.edit171:setName("edit171");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout59);
    obj.edit172:setLeft(240);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(30);
    obj.edit172:setHeight(25);
    obj.edit172:setType("number");
    obj.edit172:setMin(0);
    obj.edit172:setField("xp0_10");
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout59);
    obj.edit173:setLeft(20);
    obj.edit173:setTop(28);
    obj.edit173:setWidth(250);
    obj.edit173:setHeight(20);
    obj.edit173:setField("espec0_10");
    obj.edit173:setName("edit173");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout49);
    obj.layout60:setLeft(5);
    obj.layout60:setTop(550);
    obj.layout60:setWidth(270);
    obj.layout60:setHeight(50);
    obj.layout60:setName("layout60");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout60);
    obj.button79:setLeft(0);
    obj.button79:setTop(0);
    obj.button79:setHeight(15);
    obj.button79:setWidth(15);
    obj.button79:setText("1");
    obj.button79:setName("button79");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout60);
    obj.button80:setLeft(0);
    obj.button80:setTop(15);
    obj.button80:setHeight(15);
    obj.button80:setWidth(15);
    obj.button80:setText("2");
    obj.button80:setName("button80");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout60);
    obj.edit174:setLeft(20);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(100);
    obj.edit174:setHeight(25);
    obj.edit174:setField("nome0_11");
    obj.edit174:setName("edit174");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout60);
    obj.rectangle64:setLeft(125);
    obj.rectangle64:setTop(0);
    obj.rectangle64:setWidth(40);
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("Black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout60);
    obj.label128:setLeft(125);
    obj.label128:setTop(3);
    obj.label128:setWidth(40);
    obj.label128:setHeight(20);
    obj.label128:setField("total20_11");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout60);
    obj.edit175:setLeft(170);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(30);
    obj.edit175:setHeight(25);
    obj.edit175:setType("number");
    obj.edit175:setMin(0);
    obj.edit175:setField("base0_11");
    obj.edit175:setName("edit175");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout60);
    obj.edit176:setLeft(205);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(30);
    obj.edit176:setHeight(25);
    obj.edit176:setType("number");
    obj.edit176:setMin(0);
    obj.edit176:setField("bonus0_11");
    obj.edit176:setName("edit176");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout60);
    obj.edit177:setLeft(240);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(30);
    obj.edit177:setHeight(25);
    obj.edit177:setType("number");
    obj.edit177:setMin(0);
    obj.edit177:setField("xp0_11");
    obj.edit177:setName("edit177");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout60);
    obj.edit178:setLeft(20);
    obj.edit178:setTop(28);
    obj.edit178:setWidth(250);
    obj.edit178:setHeight(20);
    obj.edit178:setField("espec0_11");
    obj.edit178:setName("edit178");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout49);
    obj.layout61:setLeft(5);
    obj.layout61:setTop(600);
    obj.layout61:setWidth(270);
    obj.layout61:setHeight(50);
    obj.layout61:setName("layout61");

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.layout61);
    obj.button81:setLeft(0);
    obj.button81:setTop(0);
    obj.button81:setHeight(15);
    obj.button81:setWidth(15);
    obj.button81:setText("1");
    obj.button81:setName("button81");

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.layout61);
    obj.button82:setLeft(0);
    obj.button82:setTop(15);
    obj.button82:setHeight(15);
    obj.button82:setWidth(15);
    obj.button82:setText("2");
    obj.button82:setName("button82");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout61);
    obj.edit179:setLeft(20);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(100);
    obj.edit179:setHeight(25);
    obj.edit179:setField("nome0_12");
    obj.edit179:setName("edit179");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout61);
    obj.rectangle65:setLeft(125);
    obj.rectangle65:setTop(0);
    obj.rectangle65:setWidth(40);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("Black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout61);
    obj.label129:setLeft(125);
    obj.label129:setTop(3);
    obj.label129:setWidth(40);
    obj.label129:setHeight(20);
    obj.label129:setField("total20_12");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout61);
    obj.edit180:setLeft(170);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(30);
    obj.edit180:setHeight(25);
    obj.edit180:setType("number");
    obj.edit180:setMin(0);
    obj.edit180:setField("base0_12");
    obj.edit180:setName("edit180");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout61);
    obj.edit181:setLeft(205);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(30);
    obj.edit181:setHeight(25);
    obj.edit181:setType("number");
    obj.edit181:setMin(0);
    obj.edit181:setField("bonus0_12");
    obj.edit181:setName("edit181");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout61);
    obj.edit182:setLeft(240);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(30);
    obj.edit182:setHeight(25);
    obj.edit182:setType("number");
    obj.edit182:setMin(0);
    obj.edit182:setField("xp0_12");
    obj.edit182:setName("edit182");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout61);
    obj.edit183:setLeft(20);
    obj.edit183:setTop(28);
    obj.edit183:setWidth(250);
    obj.edit183:setHeight(20);
    obj.edit183:setField("espec0_12");
    obj.edit183:setName("edit183");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox4);
    obj.layout62:setLeft(300);
    obj.layout62:setTop(0);
    obj.layout62:setWidth(280);
    obj.layout62:setHeight(630);
    obj.layout62:setName("layout62");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout62);
    obj.rectangle66:setLeft(0);
    obj.rectangle66:setTop(0);
    obj.rectangle66:setWidth(280);
    obj.rectangle66:setHeight(630);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setXradius(15);
    obj.rectangle66:setYradius(15);
    obj.rectangle66:setCornerType("round");
    obj.rectangle66:setName("rectangle66");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout62);
    obj.label130:setLeft(5);
    obj.label130:setTop(0);
    obj.label130:setWidth(240);
    obj.label130:setHeight(20);
    obj.label130:setText("CONHECIMENTOS FISICOS");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout62);
    obj.label131:setLeft(25);
    obj.label131:setTop(25);
    obj.label131:setWidth(315);
    obj.label131:setHeight(20);
    obj.label131:setText(" Nome");
    obj.label131:setName("label131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout62);
    obj.label132:setLeft(135);
    obj.label132:setTop(25);
    obj.label132:setWidth(315);
    obj.label132:setHeight(20);
    obj.label132:setText("Total");
    obj.label132:setName("label132");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout62);
    obj.label133:setLeft(170);
    obj.label133:setTop(25);
    obj.label133:setWidth(315);
    obj.label133:setHeight(20);
    obj.label133:setText(" Inic");
    obj.label133:setName("label133");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout62);
    obj.label134:setLeft(202);
    obj.label134:setTop(25);
    obj.label134:setWidth(315);
    obj.label134:setHeight(20);
    obj.label134:setText(" Apr.");
    obj.label134:setName("label134");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout62);
    obj.label135:setLeft(235);
    obj.label135:setTop(25);
    obj.label135:setWidth(315);
    obj.label135:setHeight(20);
    obj.label135:setText("  XP");
    obj.label135:setName("label135");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setLeft(5);
    obj.layout63:setTop(50);
    obj.layout63:setWidth(270);
    obj.layout63:setHeight(50);
    obj.layout63:setName("layout63");

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.layout63);
    obj.button83:setLeft(0);
    obj.button83:setTop(0);
    obj.button83:setHeight(15);
    obj.button83:setWidth(15);
    obj.button83:setText("1");
    obj.button83:setName("button83");

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.layout63);
    obj.button84:setLeft(0);
    obj.button84:setTop(15);
    obj.button84:setHeight(15);
    obj.button84:setWidth(15);
    obj.button84:setText("2");
    obj.button84:setName("button84");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout63);
    obj.edit184:setLeft(20);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(100);
    obj.edit184:setHeight(25);
    obj.edit184:setField("nome2_1");
    obj.edit184:setName("edit184");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout63);
    obj.rectangle67:setLeft(125);
    obj.rectangle67:setTop(0);
    obj.rectangle67:setWidth(40);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("Black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout63);
    obj.label136:setLeft(125);
    obj.label136:setTop(3);
    obj.label136:setWidth(40);
    obj.label136:setHeight(20);
    obj.label136:setField("total22_1");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout63);
    obj.edit185:setLeft(170);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(30);
    obj.edit185:setHeight(25);
    obj.edit185:setType("number");
    obj.edit185:setMin(0);
    obj.edit185:setField("base2_1");
    obj.edit185:setName("edit185");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout63);
    obj.edit186:setLeft(205);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(30);
    obj.edit186:setHeight(25);
    obj.edit186:setType("number");
    obj.edit186:setMin(0);
    obj.edit186:setField("bonus2_1");
    obj.edit186:setName("edit186");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout63);
    obj.edit187:setLeft(240);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(30);
    obj.edit187:setHeight(25);
    obj.edit187:setType("number");
    obj.edit187:setMin(0);
    obj.edit187:setField("xp2_1");
    obj.edit187:setName("edit187");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout63);
    obj.edit188:setLeft(20);
    obj.edit188:setTop(28);
    obj.edit188:setWidth(250);
    obj.edit188:setHeight(20);
    obj.edit188:setField("espec2_1");
    obj.edit188:setName("edit188");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout62);
    obj.layout64:setLeft(5);
    obj.layout64:setTop(100);
    obj.layout64:setWidth(270);
    obj.layout64:setHeight(50);
    obj.layout64:setName("layout64");

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.layout64);
    obj.button85:setLeft(0);
    obj.button85:setTop(0);
    obj.button85:setHeight(15);
    obj.button85:setWidth(15);
    obj.button85:setText("1");
    obj.button85:setName("button85");

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.layout64);
    obj.button86:setLeft(0);
    obj.button86:setTop(15);
    obj.button86:setHeight(15);
    obj.button86:setWidth(15);
    obj.button86:setText("2");
    obj.button86:setName("button86");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout64);
    obj.edit189:setLeft(20);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(100);
    obj.edit189:setHeight(25);
    obj.edit189:setField("nome2_2");
    obj.edit189:setName("edit189");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout64);
    obj.rectangle68:setLeft(125);
    obj.rectangle68:setTop(0);
    obj.rectangle68:setWidth(40);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setColor("Black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout64);
    obj.label137:setLeft(125);
    obj.label137:setTop(3);
    obj.label137:setWidth(40);
    obj.label137:setHeight(20);
    obj.label137:setField("total22_2");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout64);
    obj.edit190:setLeft(170);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(30);
    obj.edit190:setHeight(25);
    obj.edit190:setType("number");
    obj.edit190:setMin(0);
    obj.edit190:setField("base2_2");
    obj.edit190:setName("edit190");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout64);
    obj.edit191:setLeft(205);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(30);
    obj.edit191:setHeight(25);
    obj.edit191:setType("number");
    obj.edit191:setMin(0);
    obj.edit191:setField("bonus2_2");
    obj.edit191:setName("edit191");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout64);
    obj.edit192:setLeft(240);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(30);
    obj.edit192:setHeight(25);
    obj.edit192:setType("number");
    obj.edit192:setMin(0);
    obj.edit192:setField("xp2_2");
    obj.edit192:setName("edit192");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout64);
    obj.edit193:setLeft(20);
    obj.edit193:setTop(28);
    obj.edit193:setWidth(250);
    obj.edit193:setHeight(20);
    obj.edit193:setField("espec2_2");
    obj.edit193:setName("edit193");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout62);
    obj.layout65:setLeft(5);
    obj.layout65:setTop(150);
    obj.layout65:setWidth(270);
    obj.layout65:setHeight(50);
    obj.layout65:setName("layout65");

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.layout65);
    obj.button87:setLeft(0);
    obj.button87:setTop(0);
    obj.button87:setHeight(15);
    obj.button87:setWidth(15);
    obj.button87:setText("1");
    obj.button87:setName("button87");

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.layout65);
    obj.button88:setLeft(0);
    obj.button88:setTop(15);
    obj.button88:setHeight(15);
    obj.button88:setWidth(15);
    obj.button88:setText("2");
    obj.button88:setName("button88");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout65);
    obj.edit194:setLeft(20);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(100);
    obj.edit194:setHeight(25);
    obj.edit194:setField("nome2_3");
    obj.edit194:setName("edit194");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout65);
    obj.rectangle69:setLeft(125);
    obj.rectangle69:setTop(0);
    obj.rectangle69:setWidth(40);
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setColor("Black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout65);
    obj.label138:setLeft(125);
    obj.label138:setTop(3);
    obj.label138:setWidth(40);
    obj.label138:setHeight(20);
    obj.label138:setField("total22_3");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout65);
    obj.edit195:setLeft(170);
    obj.edit195:setTop(0);
    obj.edit195:setWidth(30);
    obj.edit195:setHeight(25);
    obj.edit195:setType("number");
    obj.edit195:setMin(0);
    obj.edit195:setField("base2_3");
    obj.edit195:setName("edit195");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout65);
    obj.edit196:setLeft(205);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(30);
    obj.edit196:setHeight(25);
    obj.edit196:setType("number");
    obj.edit196:setMin(0);
    obj.edit196:setField("bonus2_3");
    obj.edit196:setName("edit196");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout65);
    obj.edit197:setLeft(240);
    obj.edit197:setTop(0);
    obj.edit197:setWidth(30);
    obj.edit197:setHeight(25);
    obj.edit197:setType("number");
    obj.edit197:setMin(0);
    obj.edit197:setField("xp2_3");
    obj.edit197:setName("edit197");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout65);
    obj.edit198:setLeft(20);
    obj.edit198:setTop(28);
    obj.edit198:setWidth(250);
    obj.edit198:setHeight(20);
    obj.edit198:setField("espec2_3");
    obj.edit198:setName("edit198");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout62);
    obj.layout66:setLeft(5);
    obj.layout66:setTop(200);
    obj.layout66:setWidth(270);
    obj.layout66:setHeight(50);
    obj.layout66:setName("layout66");

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.layout66);
    obj.button89:setLeft(0);
    obj.button89:setTop(0);
    obj.button89:setHeight(15);
    obj.button89:setWidth(15);
    obj.button89:setText("1");
    obj.button89:setName("button89");

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.layout66);
    obj.button90:setLeft(0);
    obj.button90:setTop(15);
    obj.button90:setHeight(15);
    obj.button90:setWidth(15);
    obj.button90:setText("2");
    obj.button90:setName("button90");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout66);
    obj.edit199:setLeft(20);
    obj.edit199:setTop(0);
    obj.edit199:setWidth(100);
    obj.edit199:setHeight(25);
    obj.edit199:setField("nome2_4");
    obj.edit199:setName("edit199");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout66);
    obj.rectangle70:setLeft(125);
    obj.rectangle70:setTop(0);
    obj.rectangle70:setWidth(40);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("Black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout66);
    obj.label139:setLeft(125);
    obj.label139:setTop(3);
    obj.label139:setWidth(40);
    obj.label139:setHeight(20);
    obj.label139:setField("total22_4");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout66);
    obj.edit200:setLeft(170);
    obj.edit200:setTop(0);
    obj.edit200:setWidth(30);
    obj.edit200:setHeight(25);
    obj.edit200:setType("number");
    obj.edit200:setMin(0);
    obj.edit200:setField("base2_4");
    obj.edit200:setName("edit200");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout66);
    obj.edit201:setLeft(205);
    obj.edit201:setTop(0);
    obj.edit201:setWidth(30);
    obj.edit201:setHeight(25);
    obj.edit201:setType("number");
    obj.edit201:setMin(0);
    obj.edit201:setField("bonus2_4");
    obj.edit201:setName("edit201");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout66);
    obj.edit202:setLeft(240);
    obj.edit202:setTop(0);
    obj.edit202:setWidth(30);
    obj.edit202:setHeight(25);
    obj.edit202:setType("number");
    obj.edit202:setMin(0);
    obj.edit202:setField("xp2_4");
    obj.edit202:setName("edit202");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout66);
    obj.edit203:setLeft(20);
    obj.edit203:setTop(28);
    obj.edit203:setWidth(250);
    obj.edit203:setHeight(20);
    obj.edit203:setField("espec2_4");
    obj.edit203:setName("edit203");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout62);
    obj.layout67:setLeft(5);
    obj.layout67:setTop(250);
    obj.layout67:setWidth(270);
    obj.layout67:setHeight(50);
    obj.layout67:setName("layout67");

    obj.button91 = GUI.fromHandle(_obj_newObject("button"));
    obj.button91:setParent(obj.layout67);
    obj.button91:setLeft(0);
    obj.button91:setTop(0);
    obj.button91:setHeight(15);
    obj.button91:setWidth(15);
    obj.button91:setText("1");
    obj.button91:setName("button91");

    obj.button92 = GUI.fromHandle(_obj_newObject("button"));
    obj.button92:setParent(obj.layout67);
    obj.button92:setLeft(0);
    obj.button92:setTop(15);
    obj.button92:setHeight(15);
    obj.button92:setWidth(15);
    obj.button92:setText("2");
    obj.button92:setName("button92");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout67);
    obj.edit204:setLeft(20);
    obj.edit204:setTop(0);
    obj.edit204:setWidth(100);
    obj.edit204:setHeight(25);
    obj.edit204:setField("nome2_5");
    obj.edit204:setName("edit204");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout67);
    obj.rectangle71:setLeft(125);
    obj.rectangle71:setTop(0);
    obj.rectangle71:setWidth(40);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("Black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout67);
    obj.label140:setLeft(125);
    obj.label140:setTop(3);
    obj.label140:setWidth(40);
    obj.label140:setHeight(20);
    obj.label140:setField("total22_5");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout67);
    obj.edit205:setLeft(170);
    obj.edit205:setTop(0);
    obj.edit205:setWidth(30);
    obj.edit205:setHeight(25);
    obj.edit205:setType("number");
    obj.edit205:setMin(0);
    obj.edit205:setField("base2_5");
    obj.edit205:setName("edit205");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout67);
    obj.edit206:setLeft(205);
    obj.edit206:setTop(0);
    obj.edit206:setWidth(30);
    obj.edit206:setHeight(25);
    obj.edit206:setType("number");
    obj.edit206:setMin(0);
    obj.edit206:setField("bonus2_5");
    obj.edit206:setName("edit206");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout67);
    obj.edit207:setLeft(240);
    obj.edit207:setTop(0);
    obj.edit207:setWidth(30);
    obj.edit207:setHeight(25);
    obj.edit207:setType("number");
    obj.edit207:setMin(0);
    obj.edit207:setField("xp2_5");
    obj.edit207:setName("edit207");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout67);
    obj.edit208:setLeft(20);
    obj.edit208:setTop(28);
    obj.edit208:setWidth(250);
    obj.edit208:setHeight(20);
    obj.edit208:setField("espec2_5");
    obj.edit208:setName("edit208");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout62);
    obj.layout68:setLeft(5);
    obj.layout68:setTop(300);
    obj.layout68:setWidth(270);
    obj.layout68:setHeight(50);
    obj.layout68:setName("layout68");

    obj.button93 = GUI.fromHandle(_obj_newObject("button"));
    obj.button93:setParent(obj.layout68);
    obj.button93:setLeft(0);
    obj.button93:setTop(0);
    obj.button93:setHeight(15);
    obj.button93:setWidth(15);
    obj.button93:setText("1");
    obj.button93:setName("button93");

    obj.button94 = GUI.fromHandle(_obj_newObject("button"));
    obj.button94:setParent(obj.layout68);
    obj.button94:setLeft(0);
    obj.button94:setTop(15);
    obj.button94:setHeight(15);
    obj.button94:setWidth(15);
    obj.button94:setText("2");
    obj.button94:setName("button94");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout68);
    obj.edit209:setLeft(20);
    obj.edit209:setTop(0);
    obj.edit209:setWidth(100);
    obj.edit209:setHeight(25);
    obj.edit209:setField("nome2_6");
    obj.edit209:setName("edit209");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout68);
    obj.rectangle72:setLeft(125);
    obj.rectangle72:setTop(0);
    obj.rectangle72:setWidth(40);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("Black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout68);
    obj.label141:setLeft(125);
    obj.label141:setTop(3);
    obj.label141:setWidth(40);
    obj.label141:setHeight(20);
    obj.label141:setField("total22_6");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout68);
    obj.edit210:setLeft(170);
    obj.edit210:setTop(0);
    obj.edit210:setWidth(30);
    obj.edit210:setHeight(25);
    obj.edit210:setType("number");
    obj.edit210:setMin(0);
    obj.edit210:setField("base2_6");
    obj.edit210:setName("edit210");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout68);
    obj.edit211:setLeft(205);
    obj.edit211:setTop(0);
    obj.edit211:setWidth(30);
    obj.edit211:setHeight(25);
    obj.edit211:setType("number");
    obj.edit211:setMin(0);
    obj.edit211:setField("bonus2_6");
    obj.edit211:setName("edit211");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout68);
    obj.edit212:setLeft(240);
    obj.edit212:setTop(0);
    obj.edit212:setWidth(30);
    obj.edit212:setHeight(25);
    obj.edit212:setType("number");
    obj.edit212:setMin(0);
    obj.edit212:setField("xp2_6");
    obj.edit212:setName("edit212");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout68);
    obj.edit213:setLeft(20);
    obj.edit213:setTop(28);
    obj.edit213:setWidth(250);
    obj.edit213:setHeight(20);
    obj.edit213:setField("espec2_6");
    obj.edit213:setName("edit213");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout62);
    obj.layout69:setLeft(5);
    obj.layout69:setTop(350);
    obj.layout69:setWidth(270);
    obj.layout69:setHeight(50);
    obj.layout69:setName("layout69");

    obj.button95 = GUI.fromHandle(_obj_newObject("button"));
    obj.button95:setParent(obj.layout69);
    obj.button95:setLeft(0);
    obj.button95:setTop(0);
    obj.button95:setHeight(15);
    obj.button95:setWidth(15);
    obj.button95:setText("1");
    obj.button95:setName("button95");

    obj.button96 = GUI.fromHandle(_obj_newObject("button"));
    obj.button96:setParent(obj.layout69);
    obj.button96:setLeft(0);
    obj.button96:setTop(15);
    obj.button96:setHeight(15);
    obj.button96:setWidth(15);
    obj.button96:setText("2");
    obj.button96:setName("button96");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout69);
    obj.edit214:setLeft(20);
    obj.edit214:setTop(0);
    obj.edit214:setWidth(100);
    obj.edit214:setHeight(25);
    obj.edit214:setField("nome2_7");
    obj.edit214:setName("edit214");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout69);
    obj.rectangle73:setLeft(125);
    obj.rectangle73:setTop(0);
    obj.rectangle73:setWidth(40);
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setColor("Black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout69);
    obj.label142:setLeft(125);
    obj.label142:setTop(3);
    obj.label142:setWidth(40);
    obj.label142:setHeight(20);
    obj.label142:setField("total22_7");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout69);
    obj.edit215:setLeft(170);
    obj.edit215:setTop(0);
    obj.edit215:setWidth(30);
    obj.edit215:setHeight(25);
    obj.edit215:setType("number");
    obj.edit215:setMin(0);
    obj.edit215:setField("base2_7");
    obj.edit215:setName("edit215");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout69);
    obj.edit216:setLeft(205);
    obj.edit216:setTop(0);
    obj.edit216:setWidth(30);
    obj.edit216:setHeight(25);
    obj.edit216:setType("number");
    obj.edit216:setMin(0);
    obj.edit216:setField("bonus2_7");
    obj.edit216:setName("edit216");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout69);
    obj.edit217:setLeft(240);
    obj.edit217:setTop(0);
    obj.edit217:setWidth(30);
    obj.edit217:setHeight(25);
    obj.edit217:setType("number");
    obj.edit217:setMin(0);
    obj.edit217:setField("xp2_7");
    obj.edit217:setName("edit217");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout69);
    obj.edit218:setLeft(20);
    obj.edit218:setTop(28);
    obj.edit218:setWidth(250);
    obj.edit218:setHeight(20);
    obj.edit218:setField("espec2_7");
    obj.edit218:setName("edit218");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout62);
    obj.layout70:setLeft(5);
    obj.layout70:setTop(400);
    obj.layout70:setWidth(270);
    obj.layout70:setHeight(50);
    obj.layout70:setName("layout70");

    obj.button97 = GUI.fromHandle(_obj_newObject("button"));
    obj.button97:setParent(obj.layout70);
    obj.button97:setLeft(0);
    obj.button97:setTop(0);
    obj.button97:setHeight(15);
    obj.button97:setWidth(15);
    obj.button97:setText("1");
    obj.button97:setName("button97");

    obj.button98 = GUI.fromHandle(_obj_newObject("button"));
    obj.button98:setParent(obj.layout70);
    obj.button98:setLeft(0);
    obj.button98:setTop(15);
    obj.button98:setHeight(15);
    obj.button98:setWidth(15);
    obj.button98:setText("2");
    obj.button98:setName("button98");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout70);
    obj.edit219:setLeft(20);
    obj.edit219:setTop(0);
    obj.edit219:setWidth(100);
    obj.edit219:setHeight(25);
    obj.edit219:setField("nome2_8");
    obj.edit219:setName("edit219");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout70);
    obj.rectangle74:setLeft(125);
    obj.rectangle74:setTop(0);
    obj.rectangle74:setWidth(40);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("Black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout70);
    obj.label143:setLeft(125);
    obj.label143:setTop(3);
    obj.label143:setWidth(40);
    obj.label143:setHeight(20);
    obj.label143:setField("total22_8");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout70);
    obj.edit220:setLeft(170);
    obj.edit220:setTop(0);
    obj.edit220:setWidth(30);
    obj.edit220:setHeight(25);
    obj.edit220:setType("number");
    obj.edit220:setMin(0);
    obj.edit220:setField("base2_8");
    obj.edit220:setName("edit220");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout70);
    obj.edit221:setLeft(205);
    obj.edit221:setTop(0);
    obj.edit221:setWidth(30);
    obj.edit221:setHeight(25);
    obj.edit221:setType("number");
    obj.edit221:setMin(0);
    obj.edit221:setField("bonus2_8");
    obj.edit221:setName("edit221");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout70);
    obj.edit222:setLeft(240);
    obj.edit222:setTop(0);
    obj.edit222:setWidth(30);
    obj.edit222:setHeight(25);
    obj.edit222:setType("number");
    obj.edit222:setMin(0);
    obj.edit222:setField("xp2_8");
    obj.edit222:setName("edit222");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout70);
    obj.edit223:setLeft(20);
    obj.edit223:setTop(28);
    obj.edit223:setWidth(250);
    obj.edit223:setHeight(20);
    obj.edit223:setField("espec2_8");
    obj.edit223:setName("edit223");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout62);
    obj.layout71:setLeft(5);
    obj.layout71:setTop(450);
    obj.layout71:setWidth(270);
    obj.layout71:setHeight(50);
    obj.layout71:setName("layout71");

    obj.button99 = GUI.fromHandle(_obj_newObject("button"));
    obj.button99:setParent(obj.layout71);
    obj.button99:setLeft(0);
    obj.button99:setTop(0);
    obj.button99:setHeight(15);
    obj.button99:setWidth(15);
    obj.button99:setText("1");
    obj.button99:setName("button99");

    obj.button100 = GUI.fromHandle(_obj_newObject("button"));
    obj.button100:setParent(obj.layout71);
    obj.button100:setLeft(0);
    obj.button100:setTop(15);
    obj.button100:setHeight(15);
    obj.button100:setWidth(15);
    obj.button100:setText("2");
    obj.button100:setName("button100");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout71);
    obj.edit224:setLeft(20);
    obj.edit224:setTop(0);
    obj.edit224:setWidth(100);
    obj.edit224:setHeight(25);
    obj.edit224:setField("nome2_9");
    obj.edit224:setName("edit224");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout71);
    obj.rectangle75:setLeft(125);
    obj.rectangle75:setTop(0);
    obj.rectangle75:setWidth(40);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("Black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout71);
    obj.label144:setLeft(125);
    obj.label144:setTop(3);
    obj.label144:setWidth(40);
    obj.label144:setHeight(20);
    obj.label144:setField("total22_9");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout71);
    obj.edit225:setLeft(170);
    obj.edit225:setTop(0);
    obj.edit225:setWidth(30);
    obj.edit225:setHeight(25);
    obj.edit225:setType("number");
    obj.edit225:setMin(0);
    obj.edit225:setField("base2_9");
    obj.edit225:setName("edit225");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout71);
    obj.edit226:setLeft(205);
    obj.edit226:setTop(0);
    obj.edit226:setWidth(30);
    obj.edit226:setHeight(25);
    obj.edit226:setType("number");
    obj.edit226:setMin(0);
    obj.edit226:setField("bonus2_9");
    obj.edit226:setName("edit226");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout71);
    obj.edit227:setLeft(240);
    obj.edit227:setTop(0);
    obj.edit227:setWidth(30);
    obj.edit227:setHeight(25);
    obj.edit227:setType("number");
    obj.edit227:setMin(0);
    obj.edit227:setField("xp2_9");
    obj.edit227:setName("edit227");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout71);
    obj.edit228:setLeft(20);
    obj.edit228:setTop(28);
    obj.edit228:setWidth(250);
    obj.edit228:setHeight(20);
    obj.edit228:setField("espec2_9");
    obj.edit228:setName("edit228");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout62);
    obj.layout72:setLeft(5);
    obj.layout72:setTop(500);
    obj.layout72:setWidth(270);
    obj.layout72:setHeight(50);
    obj.layout72:setName("layout72");

    obj.button101 = GUI.fromHandle(_obj_newObject("button"));
    obj.button101:setParent(obj.layout72);
    obj.button101:setLeft(0);
    obj.button101:setTop(0);
    obj.button101:setHeight(15);
    obj.button101:setWidth(15);
    obj.button101:setText("1");
    obj.button101:setName("button101");

    obj.button102 = GUI.fromHandle(_obj_newObject("button"));
    obj.button102:setParent(obj.layout72);
    obj.button102:setLeft(0);
    obj.button102:setTop(15);
    obj.button102:setHeight(15);
    obj.button102:setWidth(15);
    obj.button102:setText("2");
    obj.button102:setName("button102");

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout72);
    obj.edit229:setLeft(20);
    obj.edit229:setTop(0);
    obj.edit229:setWidth(100);
    obj.edit229:setHeight(25);
    obj.edit229:setField("nome2_10");
    obj.edit229:setName("edit229");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout72);
    obj.rectangle76:setLeft(125);
    obj.rectangle76:setTop(0);
    obj.rectangle76:setWidth(40);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setColor("Black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout72);
    obj.label145:setLeft(125);
    obj.label145:setTop(3);
    obj.label145:setWidth(40);
    obj.label145:setHeight(20);
    obj.label145:setField("total22_10");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout72);
    obj.edit230:setLeft(170);
    obj.edit230:setTop(0);
    obj.edit230:setWidth(30);
    obj.edit230:setHeight(25);
    obj.edit230:setType("number");
    obj.edit230:setMin(0);
    obj.edit230:setField("base2_10");
    obj.edit230:setName("edit230");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout72);
    obj.edit231:setLeft(205);
    obj.edit231:setTop(0);
    obj.edit231:setWidth(30);
    obj.edit231:setHeight(25);
    obj.edit231:setType("number");
    obj.edit231:setMin(0);
    obj.edit231:setField("bonus2_10");
    obj.edit231:setName("edit231");

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout72);
    obj.edit232:setLeft(240);
    obj.edit232:setTop(0);
    obj.edit232:setWidth(30);
    obj.edit232:setHeight(25);
    obj.edit232:setType("number");
    obj.edit232:setMin(0);
    obj.edit232:setField("xp2_10");
    obj.edit232:setName("edit232");

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout72);
    obj.edit233:setLeft(20);
    obj.edit233:setTop(28);
    obj.edit233:setWidth(250);
    obj.edit233:setHeight(20);
    obj.edit233:setField("espec2_10");
    obj.edit233:setName("edit233");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout62);
    obj.layout73:setLeft(5);
    obj.layout73:setTop(550);
    obj.layout73:setWidth(270);
    obj.layout73:setHeight(50);
    obj.layout73:setName("layout73");

    obj.button103 = GUI.fromHandle(_obj_newObject("button"));
    obj.button103:setParent(obj.layout73);
    obj.button103:setLeft(0);
    obj.button103:setTop(0);
    obj.button103:setHeight(15);
    obj.button103:setWidth(15);
    obj.button103:setText("1");
    obj.button103:setName("button103");

    obj.button104 = GUI.fromHandle(_obj_newObject("button"));
    obj.button104:setParent(obj.layout73);
    obj.button104:setLeft(0);
    obj.button104:setTop(15);
    obj.button104:setHeight(15);
    obj.button104:setWidth(15);
    obj.button104:setText("2");
    obj.button104:setName("button104");

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout73);
    obj.edit234:setLeft(20);
    obj.edit234:setTop(0);
    obj.edit234:setWidth(100);
    obj.edit234:setHeight(25);
    obj.edit234:setField("nome2_11");
    obj.edit234:setName("edit234");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout73);
    obj.rectangle77:setLeft(125);
    obj.rectangle77:setTop(0);
    obj.rectangle77:setWidth(40);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setColor("Black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout73);
    obj.label146:setLeft(125);
    obj.label146:setTop(3);
    obj.label146:setWidth(40);
    obj.label146:setHeight(20);
    obj.label146:setField("total22_11");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout73);
    obj.edit235:setLeft(170);
    obj.edit235:setTop(0);
    obj.edit235:setWidth(30);
    obj.edit235:setHeight(25);
    obj.edit235:setType("number");
    obj.edit235:setMin(0);
    obj.edit235:setField("base2_11");
    obj.edit235:setName("edit235");

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout73);
    obj.edit236:setLeft(205);
    obj.edit236:setTop(0);
    obj.edit236:setWidth(30);
    obj.edit236:setHeight(25);
    obj.edit236:setType("number");
    obj.edit236:setMin(0);
    obj.edit236:setField("bonus2_11");
    obj.edit236:setName("edit236");

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout73);
    obj.edit237:setLeft(240);
    obj.edit237:setTop(0);
    obj.edit237:setWidth(30);
    obj.edit237:setHeight(25);
    obj.edit237:setType("number");
    obj.edit237:setMin(0);
    obj.edit237:setField("xp2_11");
    obj.edit237:setName("edit237");

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout73);
    obj.edit238:setLeft(20);
    obj.edit238:setTop(28);
    obj.edit238:setWidth(250);
    obj.edit238:setHeight(20);
    obj.edit238:setField("espec2_11");
    obj.edit238:setName("edit238");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout62);
    obj.layout74:setLeft(5);
    obj.layout74:setTop(600);
    obj.layout74:setWidth(270);
    obj.layout74:setHeight(50);
    obj.layout74:setName("layout74");

    obj.button105 = GUI.fromHandle(_obj_newObject("button"));
    obj.button105:setParent(obj.layout74);
    obj.button105:setLeft(0);
    obj.button105:setTop(0);
    obj.button105:setHeight(15);
    obj.button105:setWidth(15);
    obj.button105:setText("1");
    obj.button105:setName("button105");

    obj.button106 = GUI.fromHandle(_obj_newObject("button"));
    obj.button106:setParent(obj.layout74);
    obj.button106:setLeft(0);
    obj.button106:setTop(15);
    obj.button106:setHeight(15);
    obj.button106:setWidth(15);
    obj.button106:setText("2");
    obj.button106:setName("button106");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout74);
    obj.edit239:setLeft(20);
    obj.edit239:setTop(0);
    obj.edit239:setWidth(100);
    obj.edit239:setHeight(25);
    obj.edit239:setField("nome2_12");
    obj.edit239:setName("edit239");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout74);
    obj.rectangle78:setLeft(125);
    obj.rectangle78:setTop(0);
    obj.rectangle78:setWidth(40);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setColor("Black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout74);
    obj.label147:setLeft(125);
    obj.label147:setTop(3);
    obj.label147:setWidth(40);
    obj.label147:setHeight(20);
    obj.label147:setField("total22_12");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout74);
    obj.edit240:setLeft(170);
    obj.edit240:setTop(0);
    obj.edit240:setWidth(30);
    obj.edit240:setHeight(25);
    obj.edit240:setType("number");
    obj.edit240:setMin(0);
    obj.edit240:setField("base2_12");
    obj.edit240:setName("edit240");

    obj.edit241 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout74);
    obj.edit241:setLeft(205);
    obj.edit241:setTop(0);
    obj.edit241:setWidth(30);
    obj.edit241:setHeight(25);
    obj.edit241:setType("number");
    obj.edit241:setMin(0);
    obj.edit241:setField("bonus2_12");
    obj.edit241:setName("edit241");

    obj.edit242 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout74);
    obj.edit242:setLeft(240);
    obj.edit242:setTop(0);
    obj.edit242:setWidth(30);
    obj.edit242:setHeight(25);
    obj.edit242:setType("number");
    obj.edit242:setMin(0);
    obj.edit242:setField("xp2_12");
    obj.edit242:setName("edit242");

    obj.edit243 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout74);
    obj.edit243:setLeft(20);
    obj.edit243:setTop(28);
    obj.edit243:setWidth(250);
    obj.edit243:setHeight(20);
    obj.edit243:setField("espec2_12");
    obj.edit243:setName("edit243");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.scrollBox4);
    obj.layout75:setLeft(600);
    obj.layout75:setTop(0);
    obj.layout75:setWidth(280);
    obj.layout75:setHeight(630);
    obj.layout75:setName("layout75");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout75);
    obj.rectangle79:setLeft(0);
    obj.rectangle79:setTop(0);
    obj.rectangle79:setWidth(280);
    obj.rectangle79:setHeight(630);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setXradius(15);
    obj.rectangle79:setYradius(15);
    obj.rectangle79:setCornerType("round");
    obj.rectangle79:setName("rectangle79");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout75);
    obj.label148:setLeft(5);
    obj.label148:setTop(0);
    obj.label148:setWidth(240);
    obj.label148:setHeight(20);
    obj.label148:setText("TALENTOS MENTAIS");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout75);
    obj.label149:setLeft(25);
    obj.label149:setTop(25);
    obj.label149:setWidth(315);
    obj.label149:setHeight(20);
    obj.label149:setText(" Nome");
    obj.label149:setName("label149");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout75);
    obj.label150:setLeft(135);
    obj.label150:setTop(25);
    obj.label150:setWidth(315);
    obj.label150:setHeight(20);
    obj.label150:setText("Total");
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout75);
    obj.label151:setLeft(170);
    obj.label151:setTop(25);
    obj.label151:setWidth(315);
    obj.label151:setHeight(20);
    obj.label151:setText(" Inic");
    obj.label151:setName("label151");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout75);
    obj.label152:setLeft(202);
    obj.label152:setTop(25);
    obj.label152:setWidth(315);
    obj.label152:setHeight(20);
    obj.label152:setText(" Apr.");
    obj.label152:setName("label152");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout75);
    obj.label153:setLeft(235);
    obj.label153:setTop(25);
    obj.label153:setWidth(315);
    obj.label153:setHeight(20);
    obj.label153:setText("  XP");
    obj.label153:setName("label153");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout75);
    obj.layout76:setLeft(5);
    obj.layout76:setTop(50);
    obj.layout76:setWidth(270);
    obj.layout76:setHeight(50);
    obj.layout76:setName("layout76");

    obj.button107 = GUI.fromHandle(_obj_newObject("button"));
    obj.button107:setParent(obj.layout76);
    obj.button107:setLeft(0);
    obj.button107:setTop(0);
    obj.button107:setHeight(15);
    obj.button107:setWidth(15);
    obj.button107:setText("1");
    obj.button107:setName("button107");

    obj.button108 = GUI.fromHandle(_obj_newObject("button"));
    obj.button108:setParent(obj.layout76);
    obj.button108:setLeft(0);
    obj.button108:setTop(15);
    obj.button108:setHeight(15);
    obj.button108:setWidth(15);
    obj.button108:setText("2");
    obj.button108:setName("button108");

    obj.edit244 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout76);
    obj.edit244:setLeft(20);
    obj.edit244:setTop(0);
    obj.edit244:setWidth(100);
    obj.edit244:setHeight(25);
    obj.edit244:setField("nome1_1");
    obj.edit244:setName("edit244");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout76);
    obj.rectangle80:setLeft(125);
    obj.rectangle80:setTop(0);
    obj.rectangle80:setWidth(40);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("Black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout76);
    obj.label154:setLeft(125);
    obj.label154:setTop(3);
    obj.label154:setWidth(40);
    obj.label154:setHeight(20);
    obj.label154:setField("total21_1");
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.edit245 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout76);
    obj.edit245:setLeft(170);
    obj.edit245:setTop(0);
    obj.edit245:setWidth(30);
    obj.edit245:setHeight(25);
    obj.edit245:setType("number");
    obj.edit245:setMin(0);
    obj.edit245:setField("base1_1");
    obj.edit245:setName("edit245");

    obj.edit246 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout76);
    obj.edit246:setLeft(205);
    obj.edit246:setTop(0);
    obj.edit246:setWidth(30);
    obj.edit246:setHeight(25);
    obj.edit246:setType("number");
    obj.edit246:setMin(0);
    obj.edit246:setField("bonus1_1");
    obj.edit246:setName("edit246");

    obj.edit247 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout76);
    obj.edit247:setLeft(240);
    obj.edit247:setTop(0);
    obj.edit247:setWidth(30);
    obj.edit247:setHeight(25);
    obj.edit247:setType("number");
    obj.edit247:setMin(0);
    obj.edit247:setField("xp1_1");
    obj.edit247:setName("edit247");

    obj.edit248 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout76);
    obj.edit248:setLeft(20);
    obj.edit248:setTop(28);
    obj.edit248:setWidth(250);
    obj.edit248:setHeight(20);
    obj.edit248:setField("espec1_1");
    obj.edit248:setName("edit248");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout75);
    obj.layout77:setLeft(5);
    obj.layout77:setTop(100);
    obj.layout77:setWidth(270);
    obj.layout77:setHeight(50);
    obj.layout77:setName("layout77");

    obj.button109 = GUI.fromHandle(_obj_newObject("button"));
    obj.button109:setParent(obj.layout77);
    obj.button109:setLeft(0);
    obj.button109:setTop(0);
    obj.button109:setHeight(15);
    obj.button109:setWidth(15);
    obj.button109:setText("1");
    obj.button109:setName("button109");

    obj.button110 = GUI.fromHandle(_obj_newObject("button"));
    obj.button110:setParent(obj.layout77);
    obj.button110:setLeft(0);
    obj.button110:setTop(15);
    obj.button110:setHeight(15);
    obj.button110:setWidth(15);
    obj.button110:setText("2");
    obj.button110:setName("button110");

    obj.edit249 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout77);
    obj.edit249:setLeft(20);
    obj.edit249:setTop(0);
    obj.edit249:setWidth(100);
    obj.edit249:setHeight(25);
    obj.edit249:setField("nome1_2");
    obj.edit249:setName("edit249");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout77);
    obj.rectangle81:setLeft(125);
    obj.rectangle81:setTop(0);
    obj.rectangle81:setWidth(40);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("Black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout77);
    obj.label155:setLeft(125);
    obj.label155:setTop(3);
    obj.label155:setWidth(40);
    obj.label155:setHeight(20);
    obj.label155:setField("total21_2");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.edit250 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout77);
    obj.edit250:setLeft(170);
    obj.edit250:setTop(0);
    obj.edit250:setWidth(30);
    obj.edit250:setHeight(25);
    obj.edit250:setType("number");
    obj.edit250:setMin(0);
    obj.edit250:setField("base1_2");
    obj.edit250:setName("edit250");

    obj.edit251 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout77);
    obj.edit251:setLeft(205);
    obj.edit251:setTop(0);
    obj.edit251:setWidth(30);
    obj.edit251:setHeight(25);
    obj.edit251:setType("number");
    obj.edit251:setMin(0);
    obj.edit251:setField("bonus1_2");
    obj.edit251:setName("edit251");

    obj.edit252 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout77);
    obj.edit252:setLeft(240);
    obj.edit252:setTop(0);
    obj.edit252:setWidth(30);
    obj.edit252:setHeight(25);
    obj.edit252:setType("number");
    obj.edit252:setMin(0);
    obj.edit252:setField("xp1_2");
    obj.edit252:setName("edit252");

    obj.edit253 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout77);
    obj.edit253:setLeft(20);
    obj.edit253:setTop(28);
    obj.edit253:setWidth(250);
    obj.edit253:setHeight(20);
    obj.edit253:setField("espec1_2");
    obj.edit253:setName("edit253");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout75);
    obj.layout78:setLeft(5);
    obj.layout78:setTop(150);
    obj.layout78:setWidth(270);
    obj.layout78:setHeight(50);
    obj.layout78:setName("layout78");

    obj.button111 = GUI.fromHandle(_obj_newObject("button"));
    obj.button111:setParent(obj.layout78);
    obj.button111:setLeft(0);
    obj.button111:setTop(0);
    obj.button111:setHeight(15);
    obj.button111:setWidth(15);
    obj.button111:setText("1");
    obj.button111:setName("button111");

    obj.button112 = GUI.fromHandle(_obj_newObject("button"));
    obj.button112:setParent(obj.layout78);
    obj.button112:setLeft(0);
    obj.button112:setTop(15);
    obj.button112:setHeight(15);
    obj.button112:setWidth(15);
    obj.button112:setText("2");
    obj.button112:setName("button112");

    obj.edit254 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout78);
    obj.edit254:setLeft(20);
    obj.edit254:setTop(0);
    obj.edit254:setWidth(100);
    obj.edit254:setHeight(25);
    obj.edit254:setField("nome1_3");
    obj.edit254:setName("edit254");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout78);
    obj.rectangle82:setLeft(125);
    obj.rectangle82:setTop(0);
    obj.rectangle82:setWidth(40);
    obj.rectangle82:setHeight(25);
    obj.rectangle82:setColor("Black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout78);
    obj.label156:setLeft(125);
    obj.label156:setTop(3);
    obj.label156:setWidth(40);
    obj.label156:setHeight(20);
    obj.label156:setField("total21_3");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.edit255 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout78);
    obj.edit255:setLeft(170);
    obj.edit255:setTop(0);
    obj.edit255:setWidth(30);
    obj.edit255:setHeight(25);
    obj.edit255:setType("number");
    obj.edit255:setMin(0);
    obj.edit255:setField("base1_3");
    obj.edit255:setName("edit255");

    obj.edit256 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout78);
    obj.edit256:setLeft(205);
    obj.edit256:setTop(0);
    obj.edit256:setWidth(30);
    obj.edit256:setHeight(25);
    obj.edit256:setType("number");
    obj.edit256:setMin(0);
    obj.edit256:setField("bonus1_3");
    obj.edit256:setName("edit256");

    obj.edit257 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout78);
    obj.edit257:setLeft(240);
    obj.edit257:setTop(0);
    obj.edit257:setWidth(30);
    obj.edit257:setHeight(25);
    obj.edit257:setType("number");
    obj.edit257:setMin(0);
    obj.edit257:setField("xp1_3");
    obj.edit257:setName("edit257");

    obj.edit258 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout78);
    obj.edit258:setLeft(20);
    obj.edit258:setTop(28);
    obj.edit258:setWidth(250);
    obj.edit258:setHeight(20);
    obj.edit258:setField("espec1_3");
    obj.edit258:setName("edit258");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout75);
    obj.layout79:setLeft(5);
    obj.layout79:setTop(200);
    obj.layout79:setWidth(270);
    obj.layout79:setHeight(50);
    obj.layout79:setName("layout79");

    obj.button113 = GUI.fromHandle(_obj_newObject("button"));
    obj.button113:setParent(obj.layout79);
    obj.button113:setLeft(0);
    obj.button113:setTop(0);
    obj.button113:setHeight(15);
    obj.button113:setWidth(15);
    obj.button113:setText("1");
    obj.button113:setName("button113");

    obj.button114 = GUI.fromHandle(_obj_newObject("button"));
    obj.button114:setParent(obj.layout79);
    obj.button114:setLeft(0);
    obj.button114:setTop(15);
    obj.button114:setHeight(15);
    obj.button114:setWidth(15);
    obj.button114:setText("2");
    obj.button114:setName("button114");

    obj.edit259 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout79);
    obj.edit259:setLeft(20);
    obj.edit259:setTop(0);
    obj.edit259:setWidth(100);
    obj.edit259:setHeight(25);
    obj.edit259:setField("nome1_4");
    obj.edit259:setName("edit259");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout79);
    obj.rectangle83:setLeft(125);
    obj.rectangle83:setTop(0);
    obj.rectangle83:setWidth(40);
    obj.rectangle83:setHeight(25);
    obj.rectangle83:setColor("Black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout79);
    obj.label157:setLeft(125);
    obj.label157:setTop(3);
    obj.label157:setWidth(40);
    obj.label157:setHeight(20);
    obj.label157:setField("total21_4");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.edit260 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout79);
    obj.edit260:setLeft(170);
    obj.edit260:setTop(0);
    obj.edit260:setWidth(30);
    obj.edit260:setHeight(25);
    obj.edit260:setType("number");
    obj.edit260:setMin(0);
    obj.edit260:setField("base1_4");
    obj.edit260:setName("edit260");

    obj.edit261 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout79);
    obj.edit261:setLeft(205);
    obj.edit261:setTop(0);
    obj.edit261:setWidth(30);
    obj.edit261:setHeight(25);
    obj.edit261:setType("number");
    obj.edit261:setMin(0);
    obj.edit261:setField("bonus1_4");
    obj.edit261:setName("edit261");

    obj.edit262 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout79);
    obj.edit262:setLeft(240);
    obj.edit262:setTop(0);
    obj.edit262:setWidth(30);
    obj.edit262:setHeight(25);
    obj.edit262:setType("number");
    obj.edit262:setMin(0);
    obj.edit262:setField("xp1_4");
    obj.edit262:setName("edit262");

    obj.edit263 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout79);
    obj.edit263:setLeft(20);
    obj.edit263:setTop(28);
    obj.edit263:setWidth(250);
    obj.edit263:setHeight(20);
    obj.edit263:setField("espec1_4");
    obj.edit263:setName("edit263");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout75);
    obj.layout80:setLeft(5);
    obj.layout80:setTop(250);
    obj.layout80:setWidth(270);
    obj.layout80:setHeight(50);
    obj.layout80:setName("layout80");

    obj.button115 = GUI.fromHandle(_obj_newObject("button"));
    obj.button115:setParent(obj.layout80);
    obj.button115:setLeft(0);
    obj.button115:setTop(0);
    obj.button115:setHeight(15);
    obj.button115:setWidth(15);
    obj.button115:setText("1");
    obj.button115:setName("button115");

    obj.button116 = GUI.fromHandle(_obj_newObject("button"));
    obj.button116:setParent(obj.layout80);
    obj.button116:setLeft(0);
    obj.button116:setTop(15);
    obj.button116:setHeight(15);
    obj.button116:setWidth(15);
    obj.button116:setText("2");
    obj.button116:setName("button116");

    obj.edit264 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout80);
    obj.edit264:setLeft(20);
    obj.edit264:setTop(0);
    obj.edit264:setWidth(100);
    obj.edit264:setHeight(25);
    obj.edit264:setField("nome1_5");
    obj.edit264:setName("edit264");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout80);
    obj.rectangle84:setLeft(125);
    obj.rectangle84:setTop(0);
    obj.rectangle84:setWidth(40);
    obj.rectangle84:setHeight(25);
    obj.rectangle84:setColor("Black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout80);
    obj.label158:setLeft(125);
    obj.label158:setTop(3);
    obj.label158:setWidth(40);
    obj.label158:setHeight(20);
    obj.label158:setField("total21_5");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.edit265 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout80);
    obj.edit265:setLeft(170);
    obj.edit265:setTop(0);
    obj.edit265:setWidth(30);
    obj.edit265:setHeight(25);
    obj.edit265:setType("number");
    obj.edit265:setMin(0);
    obj.edit265:setField("base1_5");
    obj.edit265:setName("edit265");

    obj.edit266 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout80);
    obj.edit266:setLeft(205);
    obj.edit266:setTop(0);
    obj.edit266:setWidth(30);
    obj.edit266:setHeight(25);
    obj.edit266:setType("number");
    obj.edit266:setMin(0);
    obj.edit266:setField("bonus1_5");
    obj.edit266:setName("edit266");

    obj.edit267 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout80);
    obj.edit267:setLeft(240);
    obj.edit267:setTop(0);
    obj.edit267:setWidth(30);
    obj.edit267:setHeight(25);
    obj.edit267:setType("number");
    obj.edit267:setMin(0);
    obj.edit267:setField("xp1_5");
    obj.edit267:setName("edit267");

    obj.edit268 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout80);
    obj.edit268:setLeft(20);
    obj.edit268:setTop(28);
    obj.edit268:setWidth(250);
    obj.edit268:setHeight(20);
    obj.edit268:setField("espec1_5");
    obj.edit268:setName("edit268");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout75);
    obj.layout81:setLeft(5);
    obj.layout81:setTop(300);
    obj.layout81:setWidth(270);
    obj.layout81:setHeight(50);
    obj.layout81:setName("layout81");

    obj.button117 = GUI.fromHandle(_obj_newObject("button"));
    obj.button117:setParent(obj.layout81);
    obj.button117:setLeft(0);
    obj.button117:setTop(0);
    obj.button117:setHeight(15);
    obj.button117:setWidth(15);
    obj.button117:setText("1");
    obj.button117:setName("button117");

    obj.button118 = GUI.fromHandle(_obj_newObject("button"));
    obj.button118:setParent(obj.layout81);
    obj.button118:setLeft(0);
    obj.button118:setTop(15);
    obj.button118:setHeight(15);
    obj.button118:setWidth(15);
    obj.button118:setText("2");
    obj.button118:setName("button118");

    obj.edit269 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout81);
    obj.edit269:setLeft(20);
    obj.edit269:setTop(0);
    obj.edit269:setWidth(100);
    obj.edit269:setHeight(25);
    obj.edit269:setField("nome1_6");
    obj.edit269:setName("edit269");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout81);
    obj.rectangle85:setLeft(125);
    obj.rectangle85:setTop(0);
    obj.rectangle85:setWidth(40);
    obj.rectangle85:setHeight(25);
    obj.rectangle85:setColor("Black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout81);
    obj.label159:setLeft(125);
    obj.label159:setTop(3);
    obj.label159:setWidth(40);
    obj.label159:setHeight(20);
    obj.label159:setField("total21_6");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.edit270 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout81);
    obj.edit270:setLeft(170);
    obj.edit270:setTop(0);
    obj.edit270:setWidth(30);
    obj.edit270:setHeight(25);
    obj.edit270:setType("number");
    obj.edit270:setMin(0);
    obj.edit270:setField("base1_6");
    obj.edit270:setName("edit270");

    obj.edit271 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout81);
    obj.edit271:setLeft(205);
    obj.edit271:setTop(0);
    obj.edit271:setWidth(30);
    obj.edit271:setHeight(25);
    obj.edit271:setType("number");
    obj.edit271:setMin(0);
    obj.edit271:setField("bonus1_6");
    obj.edit271:setName("edit271");

    obj.edit272 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout81);
    obj.edit272:setLeft(240);
    obj.edit272:setTop(0);
    obj.edit272:setWidth(30);
    obj.edit272:setHeight(25);
    obj.edit272:setType("number");
    obj.edit272:setMin(0);
    obj.edit272:setField("xp1_6");
    obj.edit272:setName("edit272");

    obj.edit273 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout81);
    obj.edit273:setLeft(20);
    obj.edit273:setTop(28);
    obj.edit273:setWidth(250);
    obj.edit273:setHeight(20);
    obj.edit273:setField("espec1_6");
    obj.edit273:setName("edit273");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout75);
    obj.layout82:setLeft(5);
    obj.layout82:setTop(350);
    obj.layout82:setWidth(270);
    obj.layout82:setHeight(50);
    obj.layout82:setName("layout82");

    obj.button119 = GUI.fromHandle(_obj_newObject("button"));
    obj.button119:setParent(obj.layout82);
    obj.button119:setLeft(0);
    obj.button119:setTop(0);
    obj.button119:setHeight(15);
    obj.button119:setWidth(15);
    obj.button119:setText("1");
    obj.button119:setName("button119");

    obj.button120 = GUI.fromHandle(_obj_newObject("button"));
    obj.button120:setParent(obj.layout82);
    obj.button120:setLeft(0);
    obj.button120:setTop(15);
    obj.button120:setHeight(15);
    obj.button120:setWidth(15);
    obj.button120:setText("2");
    obj.button120:setName("button120");

    obj.edit274 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout82);
    obj.edit274:setLeft(20);
    obj.edit274:setTop(0);
    obj.edit274:setWidth(100);
    obj.edit274:setHeight(25);
    obj.edit274:setField("nome1_7");
    obj.edit274:setName("edit274");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout82);
    obj.rectangle86:setLeft(125);
    obj.rectangle86:setTop(0);
    obj.rectangle86:setWidth(40);
    obj.rectangle86:setHeight(25);
    obj.rectangle86:setColor("Black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout82);
    obj.label160:setLeft(125);
    obj.label160:setTop(3);
    obj.label160:setWidth(40);
    obj.label160:setHeight(20);
    obj.label160:setField("total21_7");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.edit275 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout82);
    obj.edit275:setLeft(170);
    obj.edit275:setTop(0);
    obj.edit275:setWidth(30);
    obj.edit275:setHeight(25);
    obj.edit275:setType("number");
    obj.edit275:setMin(0);
    obj.edit275:setField("base1_7");
    obj.edit275:setName("edit275");

    obj.edit276 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout82);
    obj.edit276:setLeft(205);
    obj.edit276:setTop(0);
    obj.edit276:setWidth(30);
    obj.edit276:setHeight(25);
    obj.edit276:setType("number");
    obj.edit276:setMin(0);
    obj.edit276:setField("bonus1_7");
    obj.edit276:setName("edit276");

    obj.edit277 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout82);
    obj.edit277:setLeft(240);
    obj.edit277:setTop(0);
    obj.edit277:setWidth(30);
    obj.edit277:setHeight(25);
    obj.edit277:setType("number");
    obj.edit277:setMin(0);
    obj.edit277:setField("xp1_7");
    obj.edit277:setName("edit277");

    obj.edit278 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout82);
    obj.edit278:setLeft(20);
    obj.edit278:setTop(28);
    obj.edit278:setWidth(250);
    obj.edit278:setHeight(20);
    obj.edit278:setField("espec1_7");
    obj.edit278:setName("edit278");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout75);
    obj.layout83:setLeft(5);
    obj.layout83:setTop(400);
    obj.layout83:setWidth(270);
    obj.layout83:setHeight(50);
    obj.layout83:setName("layout83");

    obj.button121 = GUI.fromHandle(_obj_newObject("button"));
    obj.button121:setParent(obj.layout83);
    obj.button121:setLeft(0);
    obj.button121:setTop(0);
    obj.button121:setHeight(15);
    obj.button121:setWidth(15);
    obj.button121:setText("1");
    obj.button121:setName("button121");

    obj.button122 = GUI.fromHandle(_obj_newObject("button"));
    obj.button122:setParent(obj.layout83);
    obj.button122:setLeft(0);
    obj.button122:setTop(15);
    obj.button122:setHeight(15);
    obj.button122:setWidth(15);
    obj.button122:setText("2");
    obj.button122:setName("button122");

    obj.edit279 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout83);
    obj.edit279:setLeft(20);
    obj.edit279:setTop(0);
    obj.edit279:setWidth(100);
    obj.edit279:setHeight(25);
    obj.edit279:setField("nome1_8");
    obj.edit279:setName("edit279");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout83);
    obj.rectangle87:setLeft(125);
    obj.rectangle87:setTop(0);
    obj.rectangle87:setWidth(40);
    obj.rectangle87:setHeight(25);
    obj.rectangle87:setColor("Black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout83);
    obj.label161:setLeft(125);
    obj.label161:setTop(3);
    obj.label161:setWidth(40);
    obj.label161:setHeight(20);
    obj.label161:setField("total21_8");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.edit280 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout83);
    obj.edit280:setLeft(170);
    obj.edit280:setTop(0);
    obj.edit280:setWidth(30);
    obj.edit280:setHeight(25);
    obj.edit280:setType("number");
    obj.edit280:setMin(0);
    obj.edit280:setField("base1_8");
    obj.edit280:setName("edit280");

    obj.edit281 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout83);
    obj.edit281:setLeft(205);
    obj.edit281:setTop(0);
    obj.edit281:setWidth(30);
    obj.edit281:setHeight(25);
    obj.edit281:setType("number");
    obj.edit281:setMin(0);
    obj.edit281:setField("bonus1_8");
    obj.edit281:setName("edit281");

    obj.edit282 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout83);
    obj.edit282:setLeft(240);
    obj.edit282:setTop(0);
    obj.edit282:setWidth(30);
    obj.edit282:setHeight(25);
    obj.edit282:setType("number");
    obj.edit282:setMin(0);
    obj.edit282:setField("xp1_8");
    obj.edit282:setName("edit282");

    obj.edit283 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout83);
    obj.edit283:setLeft(20);
    obj.edit283:setTop(28);
    obj.edit283:setWidth(250);
    obj.edit283:setHeight(20);
    obj.edit283:setField("espec1_8");
    obj.edit283:setName("edit283");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout75);
    obj.layout84:setLeft(5);
    obj.layout84:setTop(450);
    obj.layout84:setWidth(270);
    obj.layout84:setHeight(50);
    obj.layout84:setName("layout84");

    obj.button123 = GUI.fromHandle(_obj_newObject("button"));
    obj.button123:setParent(obj.layout84);
    obj.button123:setLeft(0);
    obj.button123:setTop(0);
    obj.button123:setHeight(15);
    obj.button123:setWidth(15);
    obj.button123:setText("1");
    obj.button123:setName("button123");

    obj.button124 = GUI.fromHandle(_obj_newObject("button"));
    obj.button124:setParent(obj.layout84);
    obj.button124:setLeft(0);
    obj.button124:setTop(15);
    obj.button124:setHeight(15);
    obj.button124:setWidth(15);
    obj.button124:setText("2");
    obj.button124:setName("button124");

    obj.edit284 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout84);
    obj.edit284:setLeft(20);
    obj.edit284:setTop(0);
    obj.edit284:setWidth(100);
    obj.edit284:setHeight(25);
    obj.edit284:setField("nome1_9");
    obj.edit284:setName("edit284");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout84);
    obj.rectangle88:setLeft(125);
    obj.rectangle88:setTop(0);
    obj.rectangle88:setWidth(40);
    obj.rectangle88:setHeight(25);
    obj.rectangle88:setColor("Black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout84);
    obj.label162:setLeft(125);
    obj.label162:setTop(3);
    obj.label162:setWidth(40);
    obj.label162:setHeight(20);
    obj.label162:setField("total21_9");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.edit285 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout84);
    obj.edit285:setLeft(170);
    obj.edit285:setTop(0);
    obj.edit285:setWidth(30);
    obj.edit285:setHeight(25);
    obj.edit285:setType("number");
    obj.edit285:setMin(0);
    obj.edit285:setField("base1_9");
    obj.edit285:setName("edit285");

    obj.edit286 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout84);
    obj.edit286:setLeft(205);
    obj.edit286:setTop(0);
    obj.edit286:setWidth(30);
    obj.edit286:setHeight(25);
    obj.edit286:setType("number");
    obj.edit286:setMin(0);
    obj.edit286:setField("bonus1_9");
    obj.edit286:setName("edit286");

    obj.edit287 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout84);
    obj.edit287:setLeft(240);
    obj.edit287:setTop(0);
    obj.edit287:setWidth(30);
    obj.edit287:setHeight(25);
    obj.edit287:setType("number");
    obj.edit287:setMin(0);
    obj.edit287:setField("xp1_9");
    obj.edit287:setName("edit287");

    obj.edit288 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout84);
    obj.edit288:setLeft(20);
    obj.edit288:setTop(28);
    obj.edit288:setWidth(250);
    obj.edit288:setHeight(20);
    obj.edit288:setField("espec1_9");
    obj.edit288:setName("edit288");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout75);
    obj.layout85:setLeft(5);
    obj.layout85:setTop(500);
    obj.layout85:setWidth(270);
    obj.layout85:setHeight(50);
    obj.layout85:setName("layout85");

    obj.button125 = GUI.fromHandle(_obj_newObject("button"));
    obj.button125:setParent(obj.layout85);
    obj.button125:setLeft(0);
    obj.button125:setTop(0);
    obj.button125:setHeight(15);
    obj.button125:setWidth(15);
    obj.button125:setText("1");
    obj.button125:setName("button125");

    obj.button126 = GUI.fromHandle(_obj_newObject("button"));
    obj.button126:setParent(obj.layout85);
    obj.button126:setLeft(0);
    obj.button126:setTop(15);
    obj.button126:setHeight(15);
    obj.button126:setWidth(15);
    obj.button126:setText("2");
    obj.button126:setName("button126");

    obj.edit289 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout85);
    obj.edit289:setLeft(20);
    obj.edit289:setTop(0);
    obj.edit289:setWidth(100);
    obj.edit289:setHeight(25);
    obj.edit289:setField("nome1_10");
    obj.edit289:setName("edit289");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout85);
    obj.rectangle89:setLeft(125);
    obj.rectangle89:setTop(0);
    obj.rectangle89:setWidth(40);
    obj.rectangle89:setHeight(25);
    obj.rectangle89:setColor("Black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout85);
    obj.label163:setLeft(125);
    obj.label163:setTop(3);
    obj.label163:setWidth(40);
    obj.label163:setHeight(20);
    obj.label163:setField("total21_10");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.edit290 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout85);
    obj.edit290:setLeft(170);
    obj.edit290:setTop(0);
    obj.edit290:setWidth(30);
    obj.edit290:setHeight(25);
    obj.edit290:setType("number");
    obj.edit290:setMin(0);
    obj.edit290:setField("base1_10");
    obj.edit290:setName("edit290");

    obj.edit291 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout85);
    obj.edit291:setLeft(205);
    obj.edit291:setTop(0);
    obj.edit291:setWidth(30);
    obj.edit291:setHeight(25);
    obj.edit291:setType("number");
    obj.edit291:setMin(0);
    obj.edit291:setField("bonus1_10");
    obj.edit291:setName("edit291");

    obj.edit292 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout85);
    obj.edit292:setLeft(240);
    obj.edit292:setTop(0);
    obj.edit292:setWidth(30);
    obj.edit292:setHeight(25);
    obj.edit292:setType("number");
    obj.edit292:setMin(0);
    obj.edit292:setField("xp1_10");
    obj.edit292:setName("edit292");

    obj.edit293 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout85);
    obj.edit293:setLeft(20);
    obj.edit293:setTop(28);
    obj.edit293:setWidth(250);
    obj.edit293:setHeight(20);
    obj.edit293:setField("espec1_10");
    obj.edit293:setName("edit293");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout75);
    obj.layout86:setLeft(5);
    obj.layout86:setTop(550);
    obj.layout86:setWidth(270);
    obj.layout86:setHeight(50);
    obj.layout86:setName("layout86");

    obj.button127 = GUI.fromHandle(_obj_newObject("button"));
    obj.button127:setParent(obj.layout86);
    obj.button127:setLeft(0);
    obj.button127:setTop(0);
    obj.button127:setHeight(15);
    obj.button127:setWidth(15);
    obj.button127:setText("1");
    obj.button127:setName("button127");

    obj.button128 = GUI.fromHandle(_obj_newObject("button"));
    obj.button128:setParent(obj.layout86);
    obj.button128:setLeft(0);
    obj.button128:setTop(15);
    obj.button128:setHeight(15);
    obj.button128:setWidth(15);
    obj.button128:setText("2");
    obj.button128:setName("button128");

    obj.edit294 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout86);
    obj.edit294:setLeft(20);
    obj.edit294:setTop(0);
    obj.edit294:setWidth(100);
    obj.edit294:setHeight(25);
    obj.edit294:setField("nome1_11");
    obj.edit294:setName("edit294");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout86);
    obj.rectangle90:setLeft(125);
    obj.rectangle90:setTop(0);
    obj.rectangle90:setWidth(40);
    obj.rectangle90:setHeight(25);
    obj.rectangle90:setColor("Black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout86);
    obj.label164:setLeft(125);
    obj.label164:setTop(3);
    obj.label164:setWidth(40);
    obj.label164:setHeight(20);
    obj.label164:setField("total21_11");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.edit295 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout86);
    obj.edit295:setLeft(170);
    obj.edit295:setTop(0);
    obj.edit295:setWidth(30);
    obj.edit295:setHeight(25);
    obj.edit295:setType("number");
    obj.edit295:setMin(0);
    obj.edit295:setField("base1_11");
    obj.edit295:setName("edit295");

    obj.edit296 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout86);
    obj.edit296:setLeft(205);
    obj.edit296:setTop(0);
    obj.edit296:setWidth(30);
    obj.edit296:setHeight(25);
    obj.edit296:setType("number");
    obj.edit296:setMin(0);
    obj.edit296:setField("bonus1_11");
    obj.edit296:setName("edit296");

    obj.edit297 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout86);
    obj.edit297:setLeft(240);
    obj.edit297:setTop(0);
    obj.edit297:setWidth(30);
    obj.edit297:setHeight(25);
    obj.edit297:setType("number");
    obj.edit297:setMin(0);
    obj.edit297:setField("xp1_11");
    obj.edit297:setName("edit297");

    obj.edit298 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout86);
    obj.edit298:setLeft(20);
    obj.edit298:setTop(28);
    obj.edit298:setWidth(250);
    obj.edit298:setHeight(20);
    obj.edit298:setField("espec1_11");
    obj.edit298:setName("edit298");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout75);
    obj.layout87:setLeft(5);
    obj.layout87:setTop(600);
    obj.layout87:setWidth(270);
    obj.layout87:setHeight(50);
    obj.layout87:setName("layout87");

    obj.button129 = GUI.fromHandle(_obj_newObject("button"));
    obj.button129:setParent(obj.layout87);
    obj.button129:setLeft(0);
    obj.button129:setTop(0);
    obj.button129:setHeight(15);
    obj.button129:setWidth(15);
    obj.button129:setText("1");
    obj.button129:setName("button129");

    obj.button130 = GUI.fromHandle(_obj_newObject("button"));
    obj.button130:setParent(obj.layout87);
    obj.button130:setLeft(0);
    obj.button130:setTop(15);
    obj.button130:setHeight(15);
    obj.button130:setWidth(15);
    obj.button130:setText("2");
    obj.button130:setName("button130");

    obj.edit299 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout87);
    obj.edit299:setLeft(20);
    obj.edit299:setTop(0);
    obj.edit299:setWidth(100);
    obj.edit299:setHeight(25);
    obj.edit299:setField("nome1_12");
    obj.edit299:setName("edit299");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout87);
    obj.rectangle91:setLeft(125);
    obj.rectangle91:setTop(0);
    obj.rectangle91:setWidth(40);
    obj.rectangle91:setHeight(25);
    obj.rectangle91:setColor("Black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout87);
    obj.label165:setLeft(125);
    obj.label165:setTop(3);
    obj.label165:setWidth(40);
    obj.label165:setHeight(20);
    obj.label165:setField("total21_12");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.edit300 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout87);
    obj.edit300:setLeft(170);
    obj.edit300:setTop(0);
    obj.edit300:setWidth(30);
    obj.edit300:setHeight(25);
    obj.edit300:setType("number");
    obj.edit300:setMin(0);
    obj.edit300:setField("base1_12");
    obj.edit300:setName("edit300");

    obj.edit301 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout87);
    obj.edit301:setLeft(205);
    obj.edit301:setTop(0);
    obj.edit301:setWidth(30);
    obj.edit301:setHeight(25);
    obj.edit301:setType("number");
    obj.edit301:setMin(0);
    obj.edit301:setField("bonus1_12");
    obj.edit301:setName("edit301");

    obj.edit302 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout87);
    obj.edit302:setLeft(240);
    obj.edit302:setTop(0);
    obj.edit302:setWidth(30);
    obj.edit302:setHeight(25);
    obj.edit302:setType("number");
    obj.edit302:setMin(0);
    obj.edit302:setField("xp1_12");
    obj.edit302:setName("edit302");

    obj.edit303 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout87);
    obj.edit303:setLeft(20);
    obj.edit303:setTop(28);
    obj.edit303:setWidth(250);
    obj.edit303:setHeight(20);
    obj.edit303:setField("espec1_12");
    obj.edit303:setName("edit303");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.scrollBox4);
    obj.layout88:setLeft(900);
    obj.layout88:setTop(0);
    obj.layout88:setWidth(280);
    obj.layout88:setHeight(630);
    obj.layout88:setName("layout88");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout88);
    obj.rectangle92:setLeft(0);
    obj.rectangle92:setTop(0);
    obj.rectangle92:setWidth(280);
    obj.rectangle92:setHeight(630);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setXradius(15);
    obj.rectangle92:setYradius(15);
    obj.rectangle92:setCornerType("round");
    obj.rectangle92:setName("rectangle92");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout88);
    obj.label166:setLeft(5);
    obj.label166:setTop(0);
    obj.label166:setWidth(240);
    obj.label166:setHeight(20);
    obj.label166:setText("CONHECIMENTOS MENTAIS");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout88);
    obj.label167:setLeft(25);
    obj.label167:setTop(25);
    obj.label167:setWidth(315);
    obj.label167:setHeight(20);
    obj.label167:setText(" Nome");
    obj.label167:setName("label167");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout88);
    obj.label168:setLeft(135);
    obj.label168:setTop(25);
    obj.label168:setWidth(315);
    obj.label168:setHeight(20);
    obj.label168:setText("Total");
    obj.label168:setName("label168");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout88);
    obj.label169:setLeft(170);
    obj.label169:setTop(25);
    obj.label169:setWidth(315);
    obj.label169:setHeight(20);
    obj.label169:setText(" Inic");
    obj.label169:setName("label169");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout88);
    obj.label170:setLeft(202);
    obj.label170:setTop(25);
    obj.label170:setWidth(315);
    obj.label170:setHeight(20);
    obj.label170:setText(" Apr.");
    obj.label170:setName("label170");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout88);
    obj.label171:setLeft(235);
    obj.label171:setTop(25);
    obj.label171:setWidth(315);
    obj.label171:setHeight(20);
    obj.label171:setText("  XP");
    obj.label171:setName("label171");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout88);
    obj.layout89:setLeft(5);
    obj.layout89:setTop(50);
    obj.layout89:setWidth(270);
    obj.layout89:setHeight(50);
    obj.layout89:setName("layout89");

    obj.button131 = GUI.fromHandle(_obj_newObject("button"));
    obj.button131:setParent(obj.layout89);
    obj.button131:setLeft(0);
    obj.button131:setTop(0);
    obj.button131:setHeight(15);
    obj.button131:setWidth(15);
    obj.button131:setText("1");
    obj.button131:setName("button131");

    obj.button132 = GUI.fromHandle(_obj_newObject("button"));
    obj.button132:setParent(obj.layout89);
    obj.button132:setLeft(0);
    obj.button132:setTop(15);
    obj.button132:setHeight(15);
    obj.button132:setWidth(15);
    obj.button132:setText("2");
    obj.button132:setName("button132");

    obj.edit304 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout89);
    obj.edit304:setLeft(20);
    obj.edit304:setTop(0);
    obj.edit304:setWidth(100);
    obj.edit304:setHeight(25);
    obj.edit304:setField("nome3_1");
    obj.edit304:setName("edit304");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout89);
    obj.rectangle93:setLeft(125);
    obj.rectangle93:setTop(0);
    obj.rectangle93:setWidth(40);
    obj.rectangle93:setHeight(25);
    obj.rectangle93:setColor("Black");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setName("rectangle93");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout89);
    obj.label172:setLeft(125);
    obj.label172:setTop(3);
    obj.label172:setWidth(40);
    obj.label172:setHeight(20);
    obj.label172:setField("total23_1");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.edit305 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout89);
    obj.edit305:setLeft(170);
    obj.edit305:setTop(0);
    obj.edit305:setWidth(30);
    obj.edit305:setHeight(25);
    obj.edit305:setType("number");
    obj.edit305:setMin(0);
    obj.edit305:setField("base3_1");
    obj.edit305:setName("edit305");

    obj.edit306 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout89);
    obj.edit306:setLeft(205);
    obj.edit306:setTop(0);
    obj.edit306:setWidth(30);
    obj.edit306:setHeight(25);
    obj.edit306:setType("number");
    obj.edit306:setMin(0);
    obj.edit306:setField("bonus3_1");
    obj.edit306:setName("edit306");

    obj.edit307 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout89);
    obj.edit307:setLeft(240);
    obj.edit307:setTop(0);
    obj.edit307:setWidth(30);
    obj.edit307:setHeight(25);
    obj.edit307:setType("number");
    obj.edit307:setMin(0);
    obj.edit307:setField("xp3_1");
    obj.edit307:setName("edit307");

    obj.edit308 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout89);
    obj.edit308:setLeft(20);
    obj.edit308:setTop(28);
    obj.edit308:setWidth(250);
    obj.edit308:setHeight(20);
    obj.edit308:setField("espec3_1");
    obj.edit308:setName("edit308");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout88);
    obj.layout90:setLeft(5);
    obj.layout90:setTop(100);
    obj.layout90:setWidth(270);
    obj.layout90:setHeight(50);
    obj.layout90:setName("layout90");

    obj.button133 = GUI.fromHandle(_obj_newObject("button"));
    obj.button133:setParent(obj.layout90);
    obj.button133:setLeft(0);
    obj.button133:setTop(0);
    obj.button133:setHeight(15);
    obj.button133:setWidth(15);
    obj.button133:setText("1");
    obj.button133:setName("button133");

    obj.button134 = GUI.fromHandle(_obj_newObject("button"));
    obj.button134:setParent(obj.layout90);
    obj.button134:setLeft(0);
    obj.button134:setTop(15);
    obj.button134:setHeight(15);
    obj.button134:setWidth(15);
    obj.button134:setText("2");
    obj.button134:setName("button134");

    obj.edit309 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout90);
    obj.edit309:setLeft(20);
    obj.edit309:setTop(0);
    obj.edit309:setWidth(100);
    obj.edit309:setHeight(25);
    obj.edit309:setField("nome3_2");
    obj.edit309:setName("edit309");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout90);
    obj.rectangle94:setLeft(125);
    obj.rectangle94:setTop(0);
    obj.rectangle94:setWidth(40);
    obj.rectangle94:setHeight(25);
    obj.rectangle94:setColor("Black");
    obj.rectangle94:setStrokeColor("white");
    obj.rectangle94:setStrokeSize(1);
    obj.rectangle94:setName("rectangle94");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout90);
    obj.label173:setLeft(125);
    obj.label173:setTop(3);
    obj.label173:setWidth(40);
    obj.label173:setHeight(20);
    obj.label173:setField("total23_2");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.edit310 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout90);
    obj.edit310:setLeft(170);
    obj.edit310:setTop(0);
    obj.edit310:setWidth(30);
    obj.edit310:setHeight(25);
    obj.edit310:setType("number");
    obj.edit310:setMin(0);
    obj.edit310:setField("base3_2");
    obj.edit310:setName("edit310");

    obj.edit311 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout90);
    obj.edit311:setLeft(205);
    obj.edit311:setTop(0);
    obj.edit311:setWidth(30);
    obj.edit311:setHeight(25);
    obj.edit311:setType("number");
    obj.edit311:setMin(0);
    obj.edit311:setField("bonus3_2");
    obj.edit311:setName("edit311");

    obj.edit312 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout90);
    obj.edit312:setLeft(240);
    obj.edit312:setTop(0);
    obj.edit312:setWidth(30);
    obj.edit312:setHeight(25);
    obj.edit312:setType("number");
    obj.edit312:setMin(0);
    obj.edit312:setField("xp3_2");
    obj.edit312:setName("edit312");

    obj.edit313 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout90);
    obj.edit313:setLeft(20);
    obj.edit313:setTop(28);
    obj.edit313:setWidth(250);
    obj.edit313:setHeight(20);
    obj.edit313:setField("espec3_2");
    obj.edit313:setName("edit313");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout88);
    obj.layout91:setLeft(5);
    obj.layout91:setTop(150);
    obj.layout91:setWidth(270);
    obj.layout91:setHeight(50);
    obj.layout91:setName("layout91");

    obj.button135 = GUI.fromHandle(_obj_newObject("button"));
    obj.button135:setParent(obj.layout91);
    obj.button135:setLeft(0);
    obj.button135:setTop(0);
    obj.button135:setHeight(15);
    obj.button135:setWidth(15);
    obj.button135:setText("1");
    obj.button135:setName("button135");

    obj.button136 = GUI.fromHandle(_obj_newObject("button"));
    obj.button136:setParent(obj.layout91);
    obj.button136:setLeft(0);
    obj.button136:setTop(15);
    obj.button136:setHeight(15);
    obj.button136:setWidth(15);
    obj.button136:setText("2");
    obj.button136:setName("button136");

    obj.edit314 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout91);
    obj.edit314:setLeft(20);
    obj.edit314:setTop(0);
    obj.edit314:setWidth(100);
    obj.edit314:setHeight(25);
    obj.edit314:setField("nome3_3");
    obj.edit314:setName("edit314");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout91);
    obj.rectangle95:setLeft(125);
    obj.rectangle95:setTop(0);
    obj.rectangle95:setWidth(40);
    obj.rectangle95:setHeight(25);
    obj.rectangle95:setColor("Black");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setName("rectangle95");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout91);
    obj.label174:setLeft(125);
    obj.label174:setTop(3);
    obj.label174:setWidth(40);
    obj.label174:setHeight(20);
    obj.label174:setField("total23_3");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.edit315 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout91);
    obj.edit315:setLeft(170);
    obj.edit315:setTop(0);
    obj.edit315:setWidth(30);
    obj.edit315:setHeight(25);
    obj.edit315:setType("number");
    obj.edit315:setMin(0);
    obj.edit315:setField("base3_3");
    obj.edit315:setName("edit315");

    obj.edit316 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout91);
    obj.edit316:setLeft(205);
    obj.edit316:setTop(0);
    obj.edit316:setWidth(30);
    obj.edit316:setHeight(25);
    obj.edit316:setType("number");
    obj.edit316:setMin(0);
    obj.edit316:setField("bonus3_3");
    obj.edit316:setName("edit316");

    obj.edit317 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout91);
    obj.edit317:setLeft(240);
    obj.edit317:setTop(0);
    obj.edit317:setWidth(30);
    obj.edit317:setHeight(25);
    obj.edit317:setType("number");
    obj.edit317:setMin(0);
    obj.edit317:setField("xp3_3");
    obj.edit317:setName("edit317");

    obj.edit318 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout91);
    obj.edit318:setLeft(20);
    obj.edit318:setTop(28);
    obj.edit318:setWidth(250);
    obj.edit318:setHeight(20);
    obj.edit318:setField("espec3_3");
    obj.edit318:setName("edit318");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout88);
    obj.layout92:setLeft(5);
    obj.layout92:setTop(200);
    obj.layout92:setWidth(270);
    obj.layout92:setHeight(50);
    obj.layout92:setName("layout92");

    obj.button137 = GUI.fromHandle(_obj_newObject("button"));
    obj.button137:setParent(obj.layout92);
    obj.button137:setLeft(0);
    obj.button137:setTop(0);
    obj.button137:setHeight(15);
    obj.button137:setWidth(15);
    obj.button137:setText("1");
    obj.button137:setName("button137");

    obj.button138 = GUI.fromHandle(_obj_newObject("button"));
    obj.button138:setParent(obj.layout92);
    obj.button138:setLeft(0);
    obj.button138:setTop(15);
    obj.button138:setHeight(15);
    obj.button138:setWidth(15);
    obj.button138:setText("2");
    obj.button138:setName("button138");

    obj.edit319 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout92);
    obj.edit319:setLeft(20);
    obj.edit319:setTop(0);
    obj.edit319:setWidth(100);
    obj.edit319:setHeight(25);
    obj.edit319:setField("nome3_4");
    obj.edit319:setName("edit319");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout92);
    obj.rectangle96:setLeft(125);
    obj.rectangle96:setTop(0);
    obj.rectangle96:setWidth(40);
    obj.rectangle96:setHeight(25);
    obj.rectangle96:setColor("Black");
    obj.rectangle96:setStrokeColor("white");
    obj.rectangle96:setStrokeSize(1);
    obj.rectangle96:setName("rectangle96");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout92);
    obj.label175:setLeft(125);
    obj.label175:setTop(3);
    obj.label175:setWidth(40);
    obj.label175:setHeight(20);
    obj.label175:setField("total23_4");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.edit320 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout92);
    obj.edit320:setLeft(170);
    obj.edit320:setTop(0);
    obj.edit320:setWidth(30);
    obj.edit320:setHeight(25);
    obj.edit320:setType("number");
    obj.edit320:setMin(0);
    obj.edit320:setField("base3_4");
    obj.edit320:setName("edit320");

    obj.edit321 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout92);
    obj.edit321:setLeft(205);
    obj.edit321:setTop(0);
    obj.edit321:setWidth(30);
    obj.edit321:setHeight(25);
    obj.edit321:setType("number");
    obj.edit321:setMin(0);
    obj.edit321:setField("bonus3_4");
    obj.edit321:setName("edit321");

    obj.edit322 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout92);
    obj.edit322:setLeft(240);
    obj.edit322:setTop(0);
    obj.edit322:setWidth(30);
    obj.edit322:setHeight(25);
    obj.edit322:setType("number");
    obj.edit322:setMin(0);
    obj.edit322:setField("xp3_4");
    obj.edit322:setName("edit322");

    obj.edit323 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout92);
    obj.edit323:setLeft(20);
    obj.edit323:setTop(28);
    obj.edit323:setWidth(250);
    obj.edit323:setHeight(20);
    obj.edit323:setField("espec3_4");
    obj.edit323:setName("edit323");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout88);
    obj.layout93:setLeft(5);
    obj.layout93:setTop(250);
    obj.layout93:setWidth(270);
    obj.layout93:setHeight(50);
    obj.layout93:setName("layout93");

    obj.button139 = GUI.fromHandle(_obj_newObject("button"));
    obj.button139:setParent(obj.layout93);
    obj.button139:setLeft(0);
    obj.button139:setTop(0);
    obj.button139:setHeight(15);
    obj.button139:setWidth(15);
    obj.button139:setText("1");
    obj.button139:setName("button139");

    obj.button140 = GUI.fromHandle(_obj_newObject("button"));
    obj.button140:setParent(obj.layout93);
    obj.button140:setLeft(0);
    obj.button140:setTop(15);
    obj.button140:setHeight(15);
    obj.button140:setWidth(15);
    obj.button140:setText("2");
    obj.button140:setName("button140");

    obj.edit324 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout93);
    obj.edit324:setLeft(20);
    obj.edit324:setTop(0);
    obj.edit324:setWidth(100);
    obj.edit324:setHeight(25);
    obj.edit324:setField("nome3_5");
    obj.edit324:setName("edit324");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout93);
    obj.rectangle97:setLeft(125);
    obj.rectangle97:setTop(0);
    obj.rectangle97:setWidth(40);
    obj.rectangle97:setHeight(25);
    obj.rectangle97:setColor("Black");
    obj.rectangle97:setStrokeColor("white");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setName("rectangle97");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout93);
    obj.label176:setLeft(125);
    obj.label176:setTop(3);
    obj.label176:setWidth(40);
    obj.label176:setHeight(20);
    obj.label176:setField("total23_5");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.edit325 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout93);
    obj.edit325:setLeft(170);
    obj.edit325:setTop(0);
    obj.edit325:setWidth(30);
    obj.edit325:setHeight(25);
    obj.edit325:setType("number");
    obj.edit325:setMin(0);
    obj.edit325:setField("base3_5");
    obj.edit325:setName("edit325");

    obj.edit326 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout93);
    obj.edit326:setLeft(205);
    obj.edit326:setTop(0);
    obj.edit326:setWidth(30);
    obj.edit326:setHeight(25);
    obj.edit326:setType("number");
    obj.edit326:setMin(0);
    obj.edit326:setField("bonus3_5");
    obj.edit326:setName("edit326");

    obj.edit327 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout93);
    obj.edit327:setLeft(240);
    obj.edit327:setTop(0);
    obj.edit327:setWidth(30);
    obj.edit327:setHeight(25);
    obj.edit327:setType("number");
    obj.edit327:setMin(0);
    obj.edit327:setField("xp3_5");
    obj.edit327:setName("edit327");

    obj.edit328 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout93);
    obj.edit328:setLeft(20);
    obj.edit328:setTop(28);
    obj.edit328:setWidth(250);
    obj.edit328:setHeight(20);
    obj.edit328:setField("espec3_5");
    obj.edit328:setName("edit328");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout88);
    obj.layout94:setLeft(5);
    obj.layout94:setTop(300);
    obj.layout94:setWidth(270);
    obj.layout94:setHeight(50);
    obj.layout94:setName("layout94");

    obj.button141 = GUI.fromHandle(_obj_newObject("button"));
    obj.button141:setParent(obj.layout94);
    obj.button141:setLeft(0);
    obj.button141:setTop(0);
    obj.button141:setHeight(15);
    obj.button141:setWidth(15);
    obj.button141:setText("1");
    obj.button141:setName("button141");

    obj.button142 = GUI.fromHandle(_obj_newObject("button"));
    obj.button142:setParent(obj.layout94);
    obj.button142:setLeft(0);
    obj.button142:setTop(15);
    obj.button142:setHeight(15);
    obj.button142:setWidth(15);
    obj.button142:setText("2");
    obj.button142:setName("button142");

    obj.edit329 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout94);
    obj.edit329:setLeft(20);
    obj.edit329:setTop(0);
    obj.edit329:setWidth(100);
    obj.edit329:setHeight(25);
    obj.edit329:setField("nome3_6");
    obj.edit329:setName("edit329");

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout94);
    obj.rectangle98:setLeft(125);
    obj.rectangle98:setTop(0);
    obj.rectangle98:setWidth(40);
    obj.rectangle98:setHeight(25);
    obj.rectangle98:setColor("Black");
    obj.rectangle98:setStrokeColor("white");
    obj.rectangle98:setStrokeSize(1);
    obj.rectangle98:setName("rectangle98");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout94);
    obj.label177:setLeft(125);
    obj.label177:setTop(3);
    obj.label177:setWidth(40);
    obj.label177:setHeight(20);
    obj.label177:setField("total23_6");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.edit330 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout94);
    obj.edit330:setLeft(170);
    obj.edit330:setTop(0);
    obj.edit330:setWidth(30);
    obj.edit330:setHeight(25);
    obj.edit330:setType("number");
    obj.edit330:setMin(0);
    obj.edit330:setField("base3_6");
    obj.edit330:setName("edit330");

    obj.edit331 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout94);
    obj.edit331:setLeft(205);
    obj.edit331:setTop(0);
    obj.edit331:setWidth(30);
    obj.edit331:setHeight(25);
    obj.edit331:setType("number");
    obj.edit331:setMin(0);
    obj.edit331:setField("bonus3_6");
    obj.edit331:setName("edit331");

    obj.edit332 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout94);
    obj.edit332:setLeft(240);
    obj.edit332:setTop(0);
    obj.edit332:setWidth(30);
    obj.edit332:setHeight(25);
    obj.edit332:setType("number");
    obj.edit332:setMin(0);
    obj.edit332:setField("xp3_6");
    obj.edit332:setName("edit332");

    obj.edit333 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout94);
    obj.edit333:setLeft(20);
    obj.edit333:setTop(28);
    obj.edit333:setWidth(250);
    obj.edit333:setHeight(20);
    obj.edit333:setField("espec3_6");
    obj.edit333:setName("edit333");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout88);
    obj.layout95:setLeft(5);
    obj.layout95:setTop(350);
    obj.layout95:setWidth(270);
    obj.layout95:setHeight(50);
    obj.layout95:setName("layout95");

    obj.button143 = GUI.fromHandle(_obj_newObject("button"));
    obj.button143:setParent(obj.layout95);
    obj.button143:setLeft(0);
    obj.button143:setTop(0);
    obj.button143:setHeight(15);
    obj.button143:setWidth(15);
    obj.button143:setText("1");
    obj.button143:setName("button143");

    obj.button144 = GUI.fromHandle(_obj_newObject("button"));
    obj.button144:setParent(obj.layout95);
    obj.button144:setLeft(0);
    obj.button144:setTop(15);
    obj.button144:setHeight(15);
    obj.button144:setWidth(15);
    obj.button144:setText("2");
    obj.button144:setName("button144");

    obj.edit334 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout95);
    obj.edit334:setLeft(20);
    obj.edit334:setTop(0);
    obj.edit334:setWidth(100);
    obj.edit334:setHeight(25);
    obj.edit334:setField("nome3_7");
    obj.edit334:setName("edit334");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout95);
    obj.rectangle99:setLeft(125);
    obj.rectangle99:setTop(0);
    obj.rectangle99:setWidth(40);
    obj.rectangle99:setHeight(25);
    obj.rectangle99:setColor("Black");
    obj.rectangle99:setStrokeColor("white");
    obj.rectangle99:setStrokeSize(1);
    obj.rectangle99:setName("rectangle99");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout95);
    obj.label178:setLeft(125);
    obj.label178:setTop(3);
    obj.label178:setWidth(40);
    obj.label178:setHeight(20);
    obj.label178:setField("total23_7");
    obj.label178:setHorzTextAlign("center");
    obj.label178:setName("label178");

    obj.edit335 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout95);
    obj.edit335:setLeft(170);
    obj.edit335:setTop(0);
    obj.edit335:setWidth(30);
    obj.edit335:setHeight(25);
    obj.edit335:setType("number");
    obj.edit335:setMin(0);
    obj.edit335:setField("base3_7");
    obj.edit335:setName("edit335");

    obj.edit336 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout95);
    obj.edit336:setLeft(205);
    obj.edit336:setTop(0);
    obj.edit336:setWidth(30);
    obj.edit336:setHeight(25);
    obj.edit336:setType("number");
    obj.edit336:setMin(0);
    obj.edit336:setField("bonus3_7");
    obj.edit336:setName("edit336");

    obj.edit337 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout95);
    obj.edit337:setLeft(240);
    obj.edit337:setTop(0);
    obj.edit337:setWidth(30);
    obj.edit337:setHeight(25);
    obj.edit337:setType("number");
    obj.edit337:setMin(0);
    obj.edit337:setField("xp3_7");
    obj.edit337:setName("edit337");

    obj.edit338 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout95);
    obj.edit338:setLeft(20);
    obj.edit338:setTop(28);
    obj.edit338:setWidth(250);
    obj.edit338:setHeight(20);
    obj.edit338:setField("espec3_7");
    obj.edit338:setName("edit338");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout88);
    obj.layout96:setLeft(5);
    obj.layout96:setTop(400);
    obj.layout96:setWidth(270);
    obj.layout96:setHeight(50);
    obj.layout96:setName("layout96");

    obj.button145 = GUI.fromHandle(_obj_newObject("button"));
    obj.button145:setParent(obj.layout96);
    obj.button145:setLeft(0);
    obj.button145:setTop(0);
    obj.button145:setHeight(15);
    obj.button145:setWidth(15);
    obj.button145:setText("1");
    obj.button145:setName("button145");

    obj.button146 = GUI.fromHandle(_obj_newObject("button"));
    obj.button146:setParent(obj.layout96);
    obj.button146:setLeft(0);
    obj.button146:setTop(15);
    obj.button146:setHeight(15);
    obj.button146:setWidth(15);
    obj.button146:setText("2");
    obj.button146:setName("button146");

    obj.edit339 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout96);
    obj.edit339:setLeft(20);
    obj.edit339:setTop(0);
    obj.edit339:setWidth(100);
    obj.edit339:setHeight(25);
    obj.edit339:setField("nome3_8");
    obj.edit339:setName("edit339");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout96);
    obj.rectangle100:setLeft(125);
    obj.rectangle100:setTop(0);
    obj.rectangle100:setWidth(40);
    obj.rectangle100:setHeight(25);
    obj.rectangle100:setColor("Black");
    obj.rectangle100:setStrokeColor("white");
    obj.rectangle100:setStrokeSize(1);
    obj.rectangle100:setName("rectangle100");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout96);
    obj.label179:setLeft(125);
    obj.label179:setTop(3);
    obj.label179:setWidth(40);
    obj.label179:setHeight(20);
    obj.label179:setField("total23_8");
    obj.label179:setHorzTextAlign("center");
    obj.label179:setName("label179");

    obj.edit340 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout96);
    obj.edit340:setLeft(170);
    obj.edit340:setTop(0);
    obj.edit340:setWidth(30);
    obj.edit340:setHeight(25);
    obj.edit340:setType("number");
    obj.edit340:setMin(0);
    obj.edit340:setField("base3_8");
    obj.edit340:setName("edit340");

    obj.edit341 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout96);
    obj.edit341:setLeft(205);
    obj.edit341:setTop(0);
    obj.edit341:setWidth(30);
    obj.edit341:setHeight(25);
    obj.edit341:setType("number");
    obj.edit341:setMin(0);
    obj.edit341:setField("bonus3_8");
    obj.edit341:setName("edit341");

    obj.edit342 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout96);
    obj.edit342:setLeft(240);
    obj.edit342:setTop(0);
    obj.edit342:setWidth(30);
    obj.edit342:setHeight(25);
    obj.edit342:setType("number");
    obj.edit342:setMin(0);
    obj.edit342:setField("xp3_8");
    obj.edit342:setName("edit342");

    obj.edit343 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout96);
    obj.edit343:setLeft(20);
    obj.edit343:setTop(28);
    obj.edit343:setWidth(250);
    obj.edit343:setHeight(20);
    obj.edit343:setField("espec3_8");
    obj.edit343:setName("edit343");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout88);
    obj.layout97:setLeft(5);
    obj.layout97:setTop(450);
    obj.layout97:setWidth(270);
    obj.layout97:setHeight(50);
    obj.layout97:setName("layout97");

    obj.button147 = GUI.fromHandle(_obj_newObject("button"));
    obj.button147:setParent(obj.layout97);
    obj.button147:setLeft(0);
    obj.button147:setTop(0);
    obj.button147:setHeight(15);
    obj.button147:setWidth(15);
    obj.button147:setText("1");
    obj.button147:setName("button147");

    obj.button148 = GUI.fromHandle(_obj_newObject("button"));
    obj.button148:setParent(obj.layout97);
    obj.button148:setLeft(0);
    obj.button148:setTop(15);
    obj.button148:setHeight(15);
    obj.button148:setWidth(15);
    obj.button148:setText("2");
    obj.button148:setName("button148");

    obj.edit344 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout97);
    obj.edit344:setLeft(20);
    obj.edit344:setTop(0);
    obj.edit344:setWidth(100);
    obj.edit344:setHeight(25);
    obj.edit344:setField("nome3_9");
    obj.edit344:setName("edit344");

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout97);
    obj.rectangle101:setLeft(125);
    obj.rectangle101:setTop(0);
    obj.rectangle101:setWidth(40);
    obj.rectangle101:setHeight(25);
    obj.rectangle101:setColor("Black");
    obj.rectangle101:setStrokeColor("white");
    obj.rectangle101:setStrokeSize(1);
    obj.rectangle101:setName("rectangle101");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout97);
    obj.label180:setLeft(125);
    obj.label180:setTop(3);
    obj.label180:setWidth(40);
    obj.label180:setHeight(20);
    obj.label180:setField("total23_9");
    obj.label180:setHorzTextAlign("center");
    obj.label180:setName("label180");

    obj.edit345 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout97);
    obj.edit345:setLeft(170);
    obj.edit345:setTop(0);
    obj.edit345:setWidth(30);
    obj.edit345:setHeight(25);
    obj.edit345:setType("number");
    obj.edit345:setMin(0);
    obj.edit345:setField("base3_9");
    obj.edit345:setName("edit345");

    obj.edit346 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout97);
    obj.edit346:setLeft(205);
    obj.edit346:setTop(0);
    obj.edit346:setWidth(30);
    obj.edit346:setHeight(25);
    obj.edit346:setType("number");
    obj.edit346:setMin(0);
    obj.edit346:setField("bonus3_9");
    obj.edit346:setName("edit346");

    obj.edit347 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout97);
    obj.edit347:setLeft(240);
    obj.edit347:setTop(0);
    obj.edit347:setWidth(30);
    obj.edit347:setHeight(25);
    obj.edit347:setType("number");
    obj.edit347:setMin(0);
    obj.edit347:setField("xp3_9");
    obj.edit347:setName("edit347");

    obj.edit348 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout97);
    obj.edit348:setLeft(20);
    obj.edit348:setTop(28);
    obj.edit348:setWidth(250);
    obj.edit348:setHeight(20);
    obj.edit348:setField("espec3_9");
    obj.edit348:setName("edit348");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout88);
    obj.layout98:setLeft(5);
    obj.layout98:setTop(500);
    obj.layout98:setWidth(270);
    obj.layout98:setHeight(50);
    obj.layout98:setName("layout98");

    obj.button149 = GUI.fromHandle(_obj_newObject("button"));
    obj.button149:setParent(obj.layout98);
    obj.button149:setLeft(0);
    obj.button149:setTop(0);
    obj.button149:setHeight(15);
    obj.button149:setWidth(15);
    obj.button149:setText("1");
    obj.button149:setName("button149");

    obj.button150 = GUI.fromHandle(_obj_newObject("button"));
    obj.button150:setParent(obj.layout98);
    obj.button150:setLeft(0);
    obj.button150:setTop(15);
    obj.button150:setHeight(15);
    obj.button150:setWidth(15);
    obj.button150:setText("2");
    obj.button150:setName("button150");

    obj.edit349 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout98);
    obj.edit349:setLeft(20);
    obj.edit349:setTop(0);
    obj.edit349:setWidth(100);
    obj.edit349:setHeight(25);
    obj.edit349:setField("nome3_10");
    obj.edit349:setName("edit349");

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout98);
    obj.rectangle102:setLeft(125);
    obj.rectangle102:setTop(0);
    obj.rectangle102:setWidth(40);
    obj.rectangle102:setHeight(25);
    obj.rectangle102:setColor("Black");
    obj.rectangle102:setStrokeColor("white");
    obj.rectangle102:setStrokeSize(1);
    obj.rectangle102:setName("rectangle102");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout98);
    obj.label181:setLeft(125);
    obj.label181:setTop(3);
    obj.label181:setWidth(40);
    obj.label181:setHeight(20);
    obj.label181:setField("total23_10");
    obj.label181:setHorzTextAlign("center");
    obj.label181:setName("label181");

    obj.edit350 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout98);
    obj.edit350:setLeft(170);
    obj.edit350:setTop(0);
    obj.edit350:setWidth(30);
    obj.edit350:setHeight(25);
    obj.edit350:setType("number");
    obj.edit350:setMin(0);
    obj.edit350:setField("base3_10");
    obj.edit350:setName("edit350");

    obj.edit351 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout98);
    obj.edit351:setLeft(205);
    obj.edit351:setTop(0);
    obj.edit351:setWidth(30);
    obj.edit351:setHeight(25);
    obj.edit351:setType("number");
    obj.edit351:setMin(0);
    obj.edit351:setField("bonus3_10");
    obj.edit351:setName("edit351");

    obj.edit352 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout98);
    obj.edit352:setLeft(240);
    obj.edit352:setTop(0);
    obj.edit352:setWidth(30);
    obj.edit352:setHeight(25);
    obj.edit352:setType("number");
    obj.edit352:setMin(0);
    obj.edit352:setField("xp3_10");
    obj.edit352:setName("edit352");

    obj.edit353 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout98);
    obj.edit353:setLeft(20);
    obj.edit353:setTop(28);
    obj.edit353:setWidth(250);
    obj.edit353:setHeight(20);
    obj.edit353:setField("espec3_10");
    obj.edit353:setName("edit353");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout88);
    obj.layout99:setLeft(5);
    obj.layout99:setTop(550);
    obj.layout99:setWidth(270);
    obj.layout99:setHeight(50);
    obj.layout99:setName("layout99");

    obj.button151 = GUI.fromHandle(_obj_newObject("button"));
    obj.button151:setParent(obj.layout99);
    obj.button151:setLeft(0);
    obj.button151:setTop(0);
    obj.button151:setHeight(15);
    obj.button151:setWidth(15);
    obj.button151:setText("1");
    obj.button151:setName("button151");

    obj.button152 = GUI.fromHandle(_obj_newObject("button"));
    obj.button152:setParent(obj.layout99);
    obj.button152:setLeft(0);
    obj.button152:setTop(15);
    obj.button152:setHeight(15);
    obj.button152:setWidth(15);
    obj.button152:setText("2");
    obj.button152:setName("button152");

    obj.edit354 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout99);
    obj.edit354:setLeft(20);
    obj.edit354:setTop(0);
    obj.edit354:setWidth(100);
    obj.edit354:setHeight(25);
    obj.edit354:setField("nome3_11");
    obj.edit354:setName("edit354");

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout99);
    obj.rectangle103:setLeft(125);
    obj.rectangle103:setTop(0);
    obj.rectangle103:setWidth(40);
    obj.rectangle103:setHeight(25);
    obj.rectangle103:setColor("Black");
    obj.rectangle103:setStrokeColor("white");
    obj.rectangle103:setStrokeSize(1);
    obj.rectangle103:setName("rectangle103");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout99);
    obj.label182:setLeft(125);
    obj.label182:setTop(3);
    obj.label182:setWidth(40);
    obj.label182:setHeight(20);
    obj.label182:setField("total23_11");
    obj.label182:setHorzTextAlign("center");
    obj.label182:setName("label182");

    obj.edit355 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout99);
    obj.edit355:setLeft(170);
    obj.edit355:setTop(0);
    obj.edit355:setWidth(30);
    obj.edit355:setHeight(25);
    obj.edit355:setType("number");
    obj.edit355:setMin(0);
    obj.edit355:setField("base3_11");
    obj.edit355:setName("edit355");

    obj.edit356 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout99);
    obj.edit356:setLeft(205);
    obj.edit356:setTop(0);
    obj.edit356:setWidth(30);
    obj.edit356:setHeight(25);
    obj.edit356:setType("number");
    obj.edit356:setMin(0);
    obj.edit356:setField("bonus3_11");
    obj.edit356:setName("edit356");

    obj.edit357 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout99);
    obj.edit357:setLeft(240);
    obj.edit357:setTop(0);
    obj.edit357:setWidth(30);
    obj.edit357:setHeight(25);
    obj.edit357:setType("number");
    obj.edit357:setMin(0);
    obj.edit357:setField("xp3_11");
    obj.edit357:setName("edit357");

    obj.edit358 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout99);
    obj.edit358:setLeft(20);
    obj.edit358:setTop(28);
    obj.edit358:setWidth(250);
    obj.edit358:setHeight(20);
    obj.edit358:setField("espec3_11");
    obj.edit358:setName("edit358");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout88);
    obj.layout100:setLeft(5);
    obj.layout100:setTop(600);
    obj.layout100:setWidth(270);
    obj.layout100:setHeight(50);
    obj.layout100:setName("layout100");

    obj.button153 = GUI.fromHandle(_obj_newObject("button"));
    obj.button153:setParent(obj.layout100);
    obj.button153:setLeft(0);
    obj.button153:setTop(0);
    obj.button153:setHeight(15);
    obj.button153:setWidth(15);
    obj.button153:setText("1");
    obj.button153:setName("button153");

    obj.button154 = GUI.fromHandle(_obj_newObject("button"));
    obj.button154:setParent(obj.layout100);
    obj.button154:setLeft(0);
    obj.button154:setTop(15);
    obj.button154:setHeight(15);
    obj.button154:setWidth(15);
    obj.button154:setText("2");
    obj.button154:setName("button154");

    obj.edit359 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout100);
    obj.edit359:setLeft(20);
    obj.edit359:setTop(0);
    obj.edit359:setWidth(100);
    obj.edit359:setHeight(25);
    obj.edit359:setField("nome3_12");
    obj.edit359:setName("edit359");

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout100);
    obj.rectangle104:setLeft(125);
    obj.rectangle104:setTop(0);
    obj.rectangle104:setWidth(40);
    obj.rectangle104:setHeight(25);
    obj.rectangle104:setColor("Black");
    obj.rectangle104:setStrokeColor("white");
    obj.rectangle104:setStrokeSize(1);
    obj.rectangle104:setName("rectangle104");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout100);
    obj.label183:setLeft(125);
    obj.label183:setTop(3);
    obj.label183:setWidth(40);
    obj.label183:setHeight(20);
    obj.label183:setField("total23_12");
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.edit360 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.layout100);
    obj.edit360:setLeft(170);
    obj.edit360:setTop(0);
    obj.edit360:setWidth(30);
    obj.edit360:setHeight(25);
    obj.edit360:setType("number");
    obj.edit360:setMin(0);
    obj.edit360:setField("base3_12");
    obj.edit360:setName("edit360");

    obj.edit361 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.layout100);
    obj.edit361:setLeft(205);
    obj.edit361:setTop(0);
    obj.edit361:setWidth(30);
    obj.edit361:setHeight(25);
    obj.edit361:setType("number");
    obj.edit361:setMin(0);
    obj.edit361:setField("bonus3_12");
    obj.edit361:setName("edit361");

    obj.edit362 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.layout100);
    obj.edit362:setLeft(240);
    obj.edit362:setTop(0);
    obj.edit362:setWidth(30);
    obj.edit362:setHeight(25);
    obj.edit362:setType("number");
    obj.edit362:setMin(0);
    obj.edit362:setField("xp3_12");
    obj.edit362:setName("edit362");

    obj.edit363 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.layout100);
    obj.edit363:setLeft(20);
    obj.edit363:setTop(28);
    obj.edit363:setWidth(250);
    obj.edit363:setHeight(20);
    obj.edit363:setField("espec3_12");
    obj.edit363:setName("edit363");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.scrollBox4);
    obj.layout101:setLeft(1200);
    obj.layout101:setTop(0);
    obj.layout101:setWidth(110);
    obj.layout101:setHeight(270);
    obj.layout101:setName("layout101");

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout101);
    obj.rectangle105:setAlign("client");
    obj.rectangle105:setColor("black");
    obj.rectangle105:setXradius(15);
    obj.rectangle105:setYradius(15);
    obj.rectangle105:setCornerType("round");
    obj.rectangle105:setName("rectangle105");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout101);
    obj.label184:setLeft(5);
    obj.label184:setTop(10);
    obj.label184:setWidth(50);
    obj.label184:setHeight(20);
    obj.label184:setText("Dado 1");
    obj.label184:setName("label184");

    obj.rectangle106 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout101);
    obj.rectangle106:setLeft(50);
    obj.rectangle106:setTop(8);
    obj.rectangle106:setWidth(35);
    obj.rectangle106:setHeight(25);
    obj.rectangle106:setColor("Black");
    obj.rectangle106:setStrokeColor("white");
    obj.rectangle106:setStrokeSize(1);
    obj.rectangle106:setName("rectangle106");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout101);
    obj.label185:setLeft(60);
    obj.label185:setTop(10);
    obj.label185:setWidth(30);
    obj.label185:setHeight(20);
    obj.label185:setField("num1");
    obj.label185:setText("val");
    obj.label185:setName("label185");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout101);
    obj.label186:setLeft(63);
    obj.label186:setTop(35);
    obj.label186:setWidth(10);
    obj.label186:setHeight(20);
    obj.label186:setText("+");
    obj.label186:setName("label186");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout101);
    obj.label187:setLeft(5);
    obj.label187:setTop(60);
    obj.label187:setWidth(50);
    obj.label187:setHeight(20);
    obj.label187:setText("Dado 2");
    obj.label187:setName("label187");

    obj.rectangle107 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout101);
    obj.rectangle107:setLeft(50);
    obj.rectangle107:setTop(58);
    obj.rectangle107:setWidth(35);
    obj.rectangle107:setHeight(25);
    obj.rectangle107:setColor("Black");
    obj.rectangle107:setStrokeColor("white");
    obj.rectangle107:setStrokeSize(1);
    obj.rectangle107:setName("rectangle107");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout101);
    obj.label188:setLeft(60);
    obj.label188:setTop(60);
    obj.label188:setWidth(30);
    obj.label188:setHeight(20);
    obj.label188:setField("num2");
    obj.label188:setText("val");
    obj.label188:setName("label188");

    obj.button155 = GUI.fromHandle(_obj_newObject("button"));
    obj.button155:setParent(obj.layout101);
    obj.button155:setLeft(85);
    obj.button155:setTop(63);
    obj.button155:setWidth(15);
    obj.button155:setHeight(15);
    obj.button155:setText("x");
    obj.button155:setFontSize(10);
    obj.button155:setName("button155");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout101);
    obj.label189:setLeft(63);
    obj.label189:setTop(85);
    obj.label189:setWidth(10);
    obj.label189:setHeight(20);
    obj.label189:setText("+");
    obj.label189:setName("label189");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout101);
    obj.label190:setLeft(5);
    obj.label190:setTop(110);
    obj.label190:setWidth(40);
    obj.label190:setHeight(20);
    obj.label190:setText("Especs");
    obj.label190:setName("label190");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout101);
    obj.comboBox2:setLeft(50);
    obj.comboBox2:setTop(110);
    obj.comboBox2:setWidth(50);
    obj.comboBox2:setItems({'0', '1,5', '3'});
    obj.comboBox2:setValues({'0', '1', '2'});
    obj.comboBox2:setValue("0");
    obj.comboBox2:setField("especBonus");
    obj.comboBox2:setName("comboBox2");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout101);
    obj.label191:setLeft(5);
    obj.label191:setTop(135);
    obj.label191:setWidth(40);
    obj.label191:setHeight(20);
    obj.label191:setText("Extra");
    obj.label191:setName("label191");

    obj.edit364 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.layout101);
    obj.edit364:setLeft(50);
    obj.edit364:setTop(135);
    obj.edit364:setWidth(30);
    obj.edit364:setHeight(25);
    obj.edit364:setField("extra");
    obj.edit364:setName("edit364");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout101);
    obj.label192:setLeft(5);
    obj.label192:setTop(165);
    obj.label192:setWidth(40);
    obj.label192:setHeight(20);
    obj.label192:setText("Dific.");
    obj.label192:setName("label192");

    obj.edit365 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.layout101);
    obj.edit365:setLeft(50);
    obj.edit365:setTop(165);
    obj.edit365:setWidth(30);
    obj.edit365:setHeight(25);
    obj.edit365:setField("dificuldade");
    obj.edit365:setType("number");
    obj.edit365:setName("edit365");

    obj.button156 = GUI.fromHandle(_obj_newObject("button"));
    obj.button156:setParent(obj.layout101);
    obj.button156:setLeft(30);
    obj.button156:setTop(195);
    obj.button156:setWidth(50);
    obj.button156:setText("ROLAR");
    obj.button156:setFontSize(11);
    obj.button156:setName("button156");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout101);
    obj.label193:setLeft(5);
    obj.label193:setTop(220);
    obj.label193:setWidth(100);
    obj.label193:setHeight(15);
    obj.label193:setField("rollnome1");
    obj.label193:setFontSize(11);
    obj.label193:setHorzTextAlign("center");
    obj.label193:setName("label193");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout101);
    obj.label194:setLeft(5);
    obj.label194:setTop(235);
    obj.label194:setWidth(100);
    obj.label194:setHeight(15);
    obj.label194:setText("+");
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout101);
    obj.label195:setLeft(5);
    obj.label195:setTop(250);
    obj.label195:setWidth(100);
    obj.label195:setHeight(15);
    obj.label195:setField("rollnome2");
    obj.label195:setFontSize(11);
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.scrollBox4);
    obj.dataLink28:setFields({'nome0_1','nome0_2','nome0_3','nome0_4','nome0_5','nome0_6','nome0_7','nome0_8','nome1_1','nome1_2','nome1_3','nome1_4','nome1_5','nome1_6','nome1_7','nome1_8','nome1_9','nome1_10','nome2_1','nome2_2','nome2_3','nome2_4','nome2_5','nome2_6','nome2_7','nome2_8','nome3_1','nome3_2','nome3_3','nome3_4','nome3_5','nome3_6','nome3_7','nome3_8','nome3_9','nome3_10'});
    obj.dataLink28:setDefaultValues({'Armas Brancas','Arremesso','Briga','Esportes','Esquiva','Furtividade','Prestidigitação','Sobrevivência','Empatia','Emp. Animais','Etiqueta','Expressão','Intimidação','Investigação','Lábia','Liderança','Manha','Prontidão','Acrobacia','Armas de Fogo','Arte da Fuga','Artes Marciais','Conduçao','Oficios','Performace','Subterfúgio','Acadêmicos','Administração','Ciências','Computação','Cultura','Direito','Medicina','Ocultismo','Política','Tecnologia'});
    obj.dataLink28:setName("dataLink28");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventario");
    obj.tab3:setName("tab3");

    obj.frmACN3 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN3:setParent(obj.tab3);
    obj.frmACN3:setName("frmACN3");
    obj.frmACN3:setAlign("client");
    obj.frmACN3:setTheme("dark");
    obj.frmACN3:setMargins({top=1});

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmACN3);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.scrollBox5);
    obj.layout102:setLeft(0);
    obj.layout102:setTop(0);
    obj.layout102:setWidth(400);
    obj.layout102:setHeight(600);
    obj.layout102:setName("layout102");

    obj.rectangle108 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.layout102);
    obj.rectangle108:setLeft(0);
    obj.rectangle108:setTop(0);
    obj.rectangle108:setWidth(400);
    obj.rectangle108:setHeight(600);
    obj.rectangle108:setColor("black");
    obj.rectangle108:setXradius(15);
    obj.rectangle108:setYradius(15);
    obj.rectangle108:setCornerType("round");
    obj.rectangle108:setName("rectangle108");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout102);
    obj.label196:setLeft(0);
    obj.label196:setTop(0);
    obj.label196:setWidth(400);
    obj.label196:setHeight(20);
    obj.label196:setText("EQUIPAMENTOS");
    obj.label196:setHorzTextAlign("center");
    obj.label196:setName("label196");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout102);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(560);
    obj.textEditor2:setField("equipamentos");
    obj.textEditor2:setName("textEditor2");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.scrollBox5);
    obj.layout103:setLeft(410);
    obj.layout103:setTop(0);
    obj.layout103:setWidth(400);
    obj.layout103:setHeight(250);
    obj.layout103:setName("layout103");

    obj.rectangle109 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.layout103);
    obj.rectangle109:setLeft(0);
    obj.rectangle109:setTop(0);
    obj.rectangle109:setWidth(400);
    obj.rectangle109:setHeight(250);
    obj.rectangle109:setColor("black");
    obj.rectangle109:setXradius(15);
    obj.rectangle109:setYradius(15);
    obj.rectangle109:setCornerType("round");
    obj.rectangle109:setName("rectangle109");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout103);
    obj.label197:setLeft(0);
    obj.label197:setTop(0);
    obj.label197:setWidth(400);
    obj.label197:setHeight(20);
    obj.label197:setText("POSSES");
    obj.label197:setHorzTextAlign("center");
    obj.label197:setName("label197");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout103);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(210);
    obj.textEditor3:setField("bens");
    obj.textEditor3:setName("textEditor3");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.scrollBox5);
    obj.layout104:setLeft(820);
    obj.layout104:setTop(0);
    obj.layout104:setWidth(400);
    obj.layout104:setHeight(250);
    obj.layout104:setName("layout104");

    obj.rectangle110 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.layout104);
    obj.rectangle110:setLeft(0);
    obj.rectangle110:setTop(0);
    obj.rectangle110:setWidth(400);
    obj.rectangle110:setHeight(250);
    obj.rectangle110:setColor("black");
    obj.rectangle110:setXradius(15);
    obj.rectangle110:setYradius(15);
    obj.rectangle110:setCornerType("round");
    obj.rectangle110:setName("rectangle110");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout104);
    obj.label198:setLeft(0);
    obj.label198:setTop(0);
    obj.label198:setWidth(400);
    obj.label198:setHeight(20);
    obj.label198:setText("OUTROS");
    obj.label198:setHorzTextAlign("center");
    obj.label198:setName("label198");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout104);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(210);
    obj.textEditor4:setField("outrosItens");
    obj.textEditor4:setName("textEditor4");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.scrollBox5);
    obj.layout105:setLeft(410);
    obj.layout105:setTop(260);
    obj.layout105:setWidth(810);
    obj.layout105:setHeight(245);
    obj.layout105:setName("layout105");

    obj.rectangle111 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout105);
    obj.rectangle111:setLeft(0);
    obj.rectangle111:setTop(0);
    obj.rectangle111:setWidth(810);
    obj.rectangle111:setHeight(245);
    obj.rectangle111:setColor("black");
    obj.rectangle111:setXradius(15);
    obj.rectangle111:setYradius(15);
    obj.rectangle111:setCornerType("round");
    obj.rectangle111:setName("rectangle111");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout105);
    obj.label199:setLeft(0);
    obj.label199:setTop(0);
    obj.label199:setWidth(810);
    obj.label199:setHeight(20);
    obj.label199:setText("ARMAS");
    obj.label199:setHorzTextAlign("center");
    obj.label199:setName("label199");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout105);
    obj.label200:setLeft(10);
    obj.label200:setTop(25);
    obj.label200:setWidth(150);
    obj.label200:setHeight(20);
    obj.label200:setText("Nome");
    obj.label200:setName("label200");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout105);
    obj.label201:setLeft(170);
    obj.label201:setTop(25);
    obj.label201:setWidth(150);
    obj.label201:setHeight(20);
    obj.label201:setText("Teste");
    obj.label201:setName("label201");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout105);
    obj.label202:setLeft(330);
    obj.label202:setTop(25);
    obj.label202:setWidth(35);
    obj.label202:setHeight(20);
    obj.label202:setText("Dific");
    obj.label202:setName("label202");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout105);
    obj.label203:setLeft(370);
    obj.label203:setTop(25);
    obj.label203:setWidth(40);
    obj.label203:setHeight(20);
    obj.label203:setText("Dano");
    obj.label203:setName("label203");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout105);
    obj.label204:setLeft(410);
    obj.label204:setTop(25);
    obj.label204:setWidth(35);
    obj.label204:setHeight(20);
    obj.label204:setText("Mun.");
    obj.label204:setName("label204");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout105);
    obj.label205:setLeft(450);
    obj.label205:setTop(25);
    obj.label205:setWidth(350);
    obj.label205:setHeight(20);
    obj.label205:setText("Outros");
    obj.label205:setName("label205");

    obj.edit366 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.layout105);
    obj.edit366:setLeft(10);
    obj.edit366:setTop(50);
    obj.edit366:setWidth(150);
    obj.edit366:setHeight(25);
    obj.edit366:setField("nome1");
    obj.edit366:setName("edit366");

    obj.edit367 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.layout105);
    obj.edit367:setLeft(170);
    obj.edit367:setTop(50);
    obj.edit367:setWidth(150);
    obj.edit367:setHeight(25);
    obj.edit367:setField("teste1");
    obj.edit367:setName("edit367");

    obj.edit368 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.layout105);
    obj.edit368:setLeft(330);
    obj.edit368:setTop(50);
    obj.edit368:setWidth(30);
    obj.edit368:setHeight(25);
    obj.edit368:setField("dificuldade1");
    obj.edit368:setName("edit368");

    obj.edit369 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.layout105);
    obj.edit369:setLeft(370);
    obj.edit369:setTop(50);
    obj.edit369:setWidth(30);
    obj.edit369:setHeight(25);
    obj.edit369:setField("dano1");
    obj.edit369:setName("edit369");

    obj.edit370 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.layout105);
    obj.edit370:setLeft(410);
    obj.edit370:setTop(50);
    obj.edit370:setWidth(30);
    obj.edit370:setHeight(25);
    obj.edit370:setField("municao1");
    obj.edit370:setName("edit370");

    obj.edit371 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout105);
    obj.edit371:setLeft(450);
    obj.edit371:setTop(50);
    obj.edit371:setWidth(350);
    obj.edit371:setHeight(25);
    obj.edit371:setField("outros1");
    obj.edit371:setName("edit371");

    obj.edit372 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout105);
    obj.edit372:setLeft(10);
    obj.edit372:setTop(80);
    obj.edit372:setWidth(150);
    obj.edit372:setHeight(25);
    obj.edit372:setField("nome2");
    obj.edit372:setName("edit372");

    obj.edit373 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout105);
    obj.edit373:setLeft(170);
    obj.edit373:setTop(80);
    obj.edit373:setWidth(150);
    obj.edit373:setHeight(25);
    obj.edit373:setField("teste2");
    obj.edit373:setName("edit373");

    obj.edit374 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout105);
    obj.edit374:setLeft(330);
    obj.edit374:setTop(80);
    obj.edit374:setWidth(30);
    obj.edit374:setHeight(25);
    obj.edit374:setField("dificuldade2");
    obj.edit374:setName("edit374");

    obj.edit375 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout105);
    obj.edit375:setLeft(370);
    obj.edit375:setTop(80);
    obj.edit375:setWidth(30);
    obj.edit375:setHeight(25);
    obj.edit375:setField("dano2");
    obj.edit375:setName("edit375");

    obj.edit376 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout105);
    obj.edit376:setLeft(410);
    obj.edit376:setTop(80);
    obj.edit376:setWidth(30);
    obj.edit376:setHeight(25);
    obj.edit376:setField("municao2");
    obj.edit376:setName("edit376");

    obj.edit377 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout105);
    obj.edit377:setLeft(450);
    obj.edit377:setTop(80);
    obj.edit377:setWidth(350);
    obj.edit377:setHeight(25);
    obj.edit377:setField("outros2");
    obj.edit377:setName("edit377");

    obj.edit378 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout105);
    obj.edit378:setLeft(10);
    obj.edit378:setTop(110);
    obj.edit378:setWidth(150);
    obj.edit378:setHeight(25);
    obj.edit378:setField("nome3");
    obj.edit378:setName("edit378");

    obj.edit379 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout105);
    obj.edit379:setLeft(170);
    obj.edit379:setTop(110);
    obj.edit379:setWidth(150);
    obj.edit379:setHeight(25);
    obj.edit379:setField("teste3");
    obj.edit379:setName("edit379");

    obj.edit380 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout105);
    obj.edit380:setLeft(330);
    obj.edit380:setTop(110);
    obj.edit380:setWidth(30);
    obj.edit380:setHeight(25);
    obj.edit380:setField("dificuldade3");
    obj.edit380:setName("edit380");

    obj.edit381 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit381:setParent(obj.layout105);
    obj.edit381:setLeft(370);
    obj.edit381:setTop(110);
    obj.edit381:setWidth(30);
    obj.edit381:setHeight(25);
    obj.edit381:setField("dano3");
    obj.edit381:setName("edit381");

    obj.edit382 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit382:setParent(obj.layout105);
    obj.edit382:setLeft(410);
    obj.edit382:setTop(110);
    obj.edit382:setWidth(30);
    obj.edit382:setHeight(25);
    obj.edit382:setField("municao3");
    obj.edit382:setName("edit382");

    obj.edit383 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit383:setParent(obj.layout105);
    obj.edit383:setLeft(450);
    obj.edit383:setTop(110);
    obj.edit383:setWidth(350);
    obj.edit383:setHeight(25);
    obj.edit383:setField("outros3");
    obj.edit383:setName("edit383");

    obj.edit384 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit384:setParent(obj.layout105);
    obj.edit384:setLeft(10);
    obj.edit384:setTop(140);
    obj.edit384:setWidth(150);
    obj.edit384:setHeight(25);
    obj.edit384:setField("nome4");
    obj.edit384:setName("edit384");

    obj.edit385 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit385:setParent(obj.layout105);
    obj.edit385:setLeft(170);
    obj.edit385:setTop(140);
    obj.edit385:setWidth(150);
    obj.edit385:setHeight(25);
    obj.edit385:setField("teste4");
    obj.edit385:setName("edit385");

    obj.edit386 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit386:setParent(obj.layout105);
    obj.edit386:setLeft(330);
    obj.edit386:setTop(140);
    obj.edit386:setWidth(30);
    obj.edit386:setHeight(25);
    obj.edit386:setField("dificuldade4");
    obj.edit386:setName("edit386");

    obj.edit387 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit387:setParent(obj.layout105);
    obj.edit387:setLeft(370);
    obj.edit387:setTop(140);
    obj.edit387:setWidth(30);
    obj.edit387:setHeight(25);
    obj.edit387:setField("dano4");
    obj.edit387:setName("edit387");

    obj.edit388 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit388:setParent(obj.layout105);
    obj.edit388:setLeft(410);
    obj.edit388:setTop(140);
    obj.edit388:setWidth(30);
    obj.edit388:setHeight(25);
    obj.edit388:setField("municao4");
    obj.edit388:setName("edit388");

    obj.edit389 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit389:setParent(obj.layout105);
    obj.edit389:setLeft(450);
    obj.edit389:setTop(140);
    obj.edit389:setWidth(350);
    obj.edit389:setHeight(25);
    obj.edit389:setField("outros4");
    obj.edit389:setName("edit389");

    obj.edit390 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit390:setParent(obj.layout105);
    obj.edit390:setLeft(10);
    obj.edit390:setTop(170);
    obj.edit390:setWidth(150);
    obj.edit390:setHeight(25);
    obj.edit390:setField("nome5");
    obj.edit390:setName("edit390");

    obj.edit391 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit391:setParent(obj.layout105);
    obj.edit391:setLeft(170);
    obj.edit391:setTop(170);
    obj.edit391:setWidth(150);
    obj.edit391:setHeight(25);
    obj.edit391:setField("teste5");
    obj.edit391:setName("edit391");

    obj.edit392 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit392:setParent(obj.layout105);
    obj.edit392:setLeft(330);
    obj.edit392:setTop(170);
    obj.edit392:setWidth(30);
    obj.edit392:setHeight(25);
    obj.edit392:setField("dificuldade5");
    obj.edit392:setName("edit392");

    obj.edit393 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit393:setParent(obj.layout105);
    obj.edit393:setLeft(370);
    obj.edit393:setTop(170);
    obj.edit393:setWidth(30);
    obj.edit393:setHeight(25);
    obj.edit393:setField("dano5");
    obj.edit393:setName("edit393");

    obj.edit394 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit394:setParent(obj.layout105);
    obj.edit394:setLeft(410);
    obj.edit394:setTop(170);
    obj.edit394:setWidth(30);
    obj.edit394:setHeight(25);
    obj.edit394:setField("municao5");
    obj.edit394:setName("edit394");

    obj.edit395 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit395:setParent(obj.layout105);
    obj.edit395:setLeft(450);
    obj.edit395:setTop(170);
    obj.edit395:setWidth(350);
    obj.edit395:setHeight(25);
    obj.edit395:setField("outros5");
    obj.edit395:setName("edit395");

    obj.edit396 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit396:setParent(obj.layout105);
    obj.edit396:setLeft(10);
    obj.edit396:setTop(200);
    obj.edit396:setWidth(150);
    obj.edit396:setHeight(25);
    obj.edit396:setField("nome6");
    obj.edit396:setName("edit396");

    obj.edit397 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit397:setParent(obj.layout105);
    obj.edit397:setLeft(170);
    obj.edit397:setTop(200);
    obj.edit397:setWidth(150);
    obj.edit397:setHeight(25);
    obj.edit397:setField("teste6");
    obj.edit397:setName("edit397");

    obj.edit398 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit398:setParent(obj.layout105);
    obj.edit398:setLeft(330);
    obj.edit398:setTop(200);
    obj.edit398:setWidth(30);
    obj.edit398:setHeight(25);
    obj.edit398:setField("dificuldade6");
    obj.edit398:setName("edit398");

    obj.edit399 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit399:setParent(obj.layout105);
    obj.edit399:setLeft(370);
    obj.edit399:setTop(200);
    obj.edit399:setWidth(30);
    obj.edit399:setHeight(25);
    obj.edit399:setField("dano6");
    obj.edit399:setName("edit399");

    obj.edit400 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit400:setParent(obj.layout105);
    obj.edit400:setLeft(410);
    obj.edit400:setTop(200);
    obj.edit400:setWidth(30);
    obj.edit400:setHeight(25);
    obj.edit400:setField("municao6");
    obj.edit400:setName("edit400");

    obj.edit401 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit401:setParent(obj.layout105);
    obj.edit401:setLeft(450);
    obj.edit401:setTop(200);
    obj.edit401:setWidth(350);
    obj.edit401:setHeight(25);
    obj.edit401:setField("outros6");
    obj.edit401:setName("edit401");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.scrollBox5);
    obj.layout106:setLeft(410);
    obj.layout106:setTop(515);
    obj.layout106:setWidth(400);
    obj.layout106:setHeight(85);
    obj.layout106:setName("layout106");

    obj.rectangle112 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout106);
    obj.rectangle112:setLeft(0);
    obj.rectangle112:setTop(0);
    obj.rectangle112:setWidth(400);
    obj.rectangle112:setHeight(85);
    obj.rectangle112:setColor("black");
    obj.rectangle112:setXradius(15);
    obj.rectangle112:setYradius(15);
    obj.rectangle112:setCornerType("round");
    obj.rectangle112:setName("rectangle112");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout106);
    obj.label206:setLeft(0);
    obj.label206:setTop(0);
    obj.label206:setWidth(400);
    obj.label206:setHeight(20);
    obj.label206:setText("PROTEÇÃO/ARMADURA");
    obj.label206:setHorzTextAlign("center");
    obj.label206:setName("label206");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout106);
    obj.label207:setLeft(10);
    obj.label207:setTop(30);
    obj.label207:setWidth(45);
    obj.label207:setHeight(20);
    obj.label207:setText("Tipo");
    obj.label207:setName("label207");

    obj.edit402 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit402:setParent(obj.layout106);
    obj.edit402:setLeft(55);
    obj.edit402:setTop(25);
    obj.edit402:setWidth(135);
    obj.edit402:setHeight(25);
    obj.edit402:setField("tipoArmadura");
    obj.edit402:setName("edit402");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout106);
    obj.label208:setLeft(195);
    obj.label208:setTop(30);
    obj.label208:setWidth(40);
    obj.label208:setHeight(20);
    obj.label208:setText("Índice");
    obj.label208:setName("label208");

    obj.edit403 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit403:setParent(obj.layout106);
    obj.edit403:setLeft(240);
    obj.edit403:setTop(25);
    obj.edit403:setWidth(35);
    obj.edit403:setHeight(25);
    obj.edit403:setField("indiceArmadura");
    obj.edit403:setName("edit403");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout106);
    obj.label209:setLeft(285);
    obj.label209:setTop(30);
    obj.label209:setWidth(70);
    obj.label209:setHeight(20);
    obj.label209:setText("Penalidade");
    obj.label209:setName("label209");

    obj.edit404 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit404:setParent(obj.layout106);
    obj.edit404:setLeft(355);
    obj.edit404:setTop(25);
    obj.edit404:setWidth(30);
    obj.edit404:setHeight(25);
    obj.edit404:setField("penalidadeArmadura");
    obj.edit404:setName("edit404");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout106);
    obj.label210:setLeft(10);
    obj.label210:setTop(55);
    obj.label210:setWidth(45);
    obj.label210:setHeight(20);
    obj.label210:setText("Outros");
    obj.label210:setName("label210");

    obj.edit405 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit405:setParent(obj.layout106);
    obj.edit405:setLeft(55);
    obj.edit405:setTop(50);
    obj.edit405:setWidth(135);
    obj.edit405:setHeight(25);
    obj.edit405:setField("outrosArmadura");
    obj.edit405:setName("edit405");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout106);
    obj.label211:setLeft(195);
    obj.label211:setTop(55);
    obj.label211:setWidth(40);
    obj.label211:setHeight(20);
    obj.label211:setText("Força");
    obj.label211:setName("label211");

    obj.edit406 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit406:setParent(obj.layout106);
    obj.edit406:setLeft(240);
    obj.edit406:setTop(50);
    obj.edit406:setWidth(35);
    obj.edit406:setHeight(25);
    obj.edit406:setField("forcaMinArmadura");
    obj.edit406:setName("edit406");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout106);
    obj.label212:setLeft(285);
    obj.label212:setTop(55);
    obj.label212:setWidth(70);
    obj.label212:setHeight(20);
    obj.label212:setText("Eficácia");
    obj.label212:setName("label212");

    obj.edit407 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit407:setParent(obj.layout106);
    obj.edit407:setLeft(355);
    obj.edit407:setTop(50);
    obj.edit407:setWidth(30);
    obj.edit407:setHeight(25);
    obj.edit407:setField("eficaciaArmadura");
    obj.edit407:setName("edit407");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.scrollBox5);
    obj.layout107:setLeft(820);
    obj.layout107:setTop(515);
    obj.layout107:setWidth(400);
    obj.layout107:setHeight(85);
    obj.layout107:setName("layout107");

    obj.rectangle113 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.layout107);
    obj.rectangle113:setLeft(0);
    obj.rectangle113:setTop(0);
    obj.rectangle113:setWidth(400);
    obj.rectangle113:setHeight(85);
    obj.rectangle113:setColor("black");
    obj.rectangle113:setXradius(15);
    obj.rectangle113:setYradius(15);
    obj.rectangle113:setCornerType("round");
    obj.rectangle113:setName("rectangle113");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout107);
    obj.label213:setLeft(0);
    obj.label213:setTop(0);
    obj.label213:setWidth(400);
    obj.label213:setHeight(20);
    obj.label213:setText("PROTEÇÃO/ESCUDO");
    obj.label213:setHorzTextAlign("center");
    obj.label213:setName("label213");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout107);
    obj.label214:setLeft(10);
    obj.label214:setTop(30);
    obj.label214:setWidth(45);
    obj.label214:setHeight(20);
    obj.label214:setText("Tipo");
    obj.label214:setName("label214");

    obj.edit408 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit408:setParent(obj.layout107);
    obj.edit408:setLeft(55);
    obj.edit408:setTop(25);
    obj.edit408:setWidth(135);
    obj.edit408:setHeight(25);
    obj.edit408:setField("tipoEscudo");
    obj.edit408:setName("edit408");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout107);
    obj.label215:setLeft(195);
    obj.label215:setTop(30);
    obj.label215:setWidth(40);
    obj.label215:setHeight(20);
    obj.label215:setText("Aparar");
    obj.label215:setName("label215");

    obj.edit409 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit409:setParent(obj.layout107);
    obj.edit409:setLeft(240);
    obj.edit409:setTop(25);
    obj.edit409:setWidth(35);
    obj.edit409:setHeight(25);
    obj.edit409:setField("apararEscudo");
    obj.edit409:setName("edit409");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout107);
    obj.label216:setLeft(285);
    obj.label216:setTop(30);
    obj.label216:setWidth(70);
    obj.label216:setHeight(20);
    obj.label216:setText("Penalidade");
    obj.label216:setName("label216");

    obj.edit410 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit410:setParent(obj.layout107);
    obj.edit410:setLeft(355);
    obj.edit410:setTop(25);
    obj.edit410:setWidth(30);
    obj.edit410:setHeight(25);
    obj.edit410:setField("penalidadeEscudo");
    obj.edit410:setName("edit410");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout107);
    obj.label217:setLeft(10);
    obj.label217:setTop(55);
    obj.label217:setWidth(45);
    obj.label217:setHeight(20);
    obj.label217:setText("Outros");
    obj.label217:setName("label217");

    obj.edit411 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit411:setParent(obj.layout107);
    obj.edit411:setLeft(55);
    obj.edit411:setTop(50);
    obj.edit411:setWidth(135);
    obj.edit411:setHeight(25);
    obj.edit411:setField("outrosEscudo");
    obj.edit411:setName("edit411");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout107);
    obj.label218:setLeft(195);
    obj.label218:setTop(55);
    obj.label218:setWidth(40);
    obj.label218:setHeight(20);
    obj.label218:setText("Força");
    obj.label218:setName("label218");

    obj.edit412 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit412:setParent(obj.layout107);
    obj.edit412:setLeft(240);
    obj.edit412:setTop(50);
    obj.edit412:setWidth(35);
    obj.edit412:setHeight(25);
    obj.edit412:setField("forcaMinEscudo");
    obj.edit412:setName("edit412");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout107);
    obj.label219:setLeft(285);
    obj.label219:setTop(55);
    obj.label219:setWidth(70);
    obj.label219:setHeight(20);
    obj.label219:setText("Cobertura");
    obj.label219:setName("label219");

    obj.edit413 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit413:setParent(obj.layout107);
    obj.edit413:setLeft(355);
    obj.edit413:setTop(50);
    obj.edit413:setWidth(30);
    obj.edit413:setHeight(25);
    obj.edit413:setField("coberturaEscudo");
    obj.edit413:setName("edit413");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Descrições");
    obj.tab4:setName("tab4");

    obj.frmACN4 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN4:setParent(obj.tab4);
    obj.frmACN4:setName("frmACN4");
    obj.frmACN4:setAlign("client");
    obj.frmACN4:setTheme("dark");
    obj.frmACN4:setMargins({top=1});

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmACN4);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.scrollBox6);
    obj.layout108:setLeft(0);
    obj.layout108:setTop(0);
    obj.layout108:setWidth(960);
    obj.layout108:setHeight(70);
    obj.layout108:setName("layout108");

    obj.rectangle114 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.layout108);
    obj.rectangle114:setLeft(5);
    obj.rectangle114:setTop(0);
    obj.rectangle114:setWidth(950);
    obj.rectangle114:setHeight(70);
    obj.rectangle114:setColor("black");
    obj.rectangle114:setXradius(15);
    obj.rectangle114:setYradius(15);
    obj.rectangle114:setCornerType("round");
    obj.rectangle114:setName("rectangle114");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout108);
    obj.layout109:setLeft(5);
    obj.layout109:setTop(5);
    obj.layout109:setWidth(310);
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout109);
    obj.label220:setLeft(0);
    obj.label220:setTop(5);
    obj.label220:setWidth(100);
    obj.label220:setHeight(20);
    obj.label220:setText("Sexo");
    obj.label220:setHorzTextAlign("trailing");
    obj.label220:setName("label220");

    obj.edit414 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit414:setParent(obj.layout109);
    obj.edit414:setLeft(110);
    obj.edit414:setTop(0);
    obj.edit414:setWidth(200);
    obj.edit414:setHeight(25);
    obj.edit414:setField("desc_sexo");
    obj.edit414:setName("edit414");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout108);
    obj.layout110:setLeft(320);
    obj.layout110:setTop(5);
    obj.layout110:setWidth(310);
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout110);
    obj.label221:setLeft(0);
    obj.label221:setTop(5);
    obj.label221:setWidth(100);
    obj.label221:setHeight(20);
    obj.label221:setText("Altura");
    obj.label221:setHorzTextAlign("trailing");
    obj.label221:setName("label221");

    obj.edit415 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit415:setParent(obj.layout110);
    obj.edit415:setLeft(110);
    obj.edit415:setTop(0);
    obj.edit415:setWidth(200);
    obj.edit415:setHeight(25);
    obj.edit415:setField("desc_altura");
    obj.edit415:setName("edit415");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout108);
    obj.layout111:setLeft(585);
    obj.layout111:setTop(5);
    obj.layout111:setWidth(310);
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout111);
    obj.label222:setLeft(0);
    obj.label222:setTop(5);
    obj.label222:setWidth(100);
    obj.label222:setHeight(20);
    obj.label222:setText("Olhos");
    obj.label222:setHorzTextAlign("trailing");
    obj.label222:setName("label222");

    obj.edit416 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit416:setParent(obj.layout111);
    obj.edit416:setLeft(110);
    obj.edit416:setTop(0);
    obj.edit416:setWidth(200);
    obj.edit416:setHeight(25);
    obj.edit416:setField("desc_olhos");
    obj.edit416:setName("edit416");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout108);
    obj.layout112:setLeft(5);
    obj.layout112:setTop(35);
    obj.layout112:setWidth(310);
    obj.layout112:setHeight(25);
    obj.layout112:setName("layout112");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout112);
    obj.label223:setLeft(0);
    obj.label223:setTop(5);
    obj.label223:setWidth(100);
    obj.label223:setHeight(20);
    obj.label223:setText("Raça");
    obj.label223:setHorzTextAlign("trailing");
    obj.label223:setName("label223");

    obj.edit417 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit417:setParent(obj.layout112);
    obj.edit417:setLeft(110);
    obj.edit417:setTop(0);
    obj.edit417:setWidth(200);
    obj.edit417:setHeight(25);
    obj.edit417:setField("desc_raca");
    obj.edit417:setName("edit417");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout108);
    obj.layout113:setLeft(320);
    obj.layout113:setTop(35);
    obj.layout113:setWidth(310);
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout113);
    obj.label224:setLeft(0);
    obj.label224:setTop(5);
    obj.label224:setWidth(100);
    obj.label224:setHeight(20);
    obj.label224:setText("Nascimento");
    obj.label224:setHorzTextAlign("trailing");
    obj.label224:setName("label224");

    obj.edit418 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit418:setParent(obj.layout113);
    obj.edit418:setLeft(110);
    obj.edit418:setTop(0);
    obj.edit418:setWidth(200);
    obj.edit418:setHeight(25);
    obj.edit418:setField("desc_nascimento");
    obj.edit418:setName("edit418");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout108);
    obj.layout114:setLeft(585);
    obj.layout114:setTop(35);
    obj.layout114:setWidth(310);
    obj.layout114:setHeight(25);
    obj.layout114:setName("layout114");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout114);
    obj.label225:setLeft(0);
    obj.label225:setTop(5);
    obj.label225:setWidth(100);
    obj.label225:setHeight(20);
    obj.label225:setText("Cabelo");
    obj.label225:setHorzTextAlign("trailing");
    obj.label225:setName("label225");

    obj.edit419 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit419:setParent(obj.layout114);
    obj.edit419:setLeft(110);
    obj.edit419:setTop(0);
    obj.edit419:setWidth(200);
    obj.edit419:setHeight(25);
    obj.edit419:setField("desc_cabelo");
    obj.edit419:setName("edit419");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.scrollBox6);
    obj.layout115:setLeft(0);
    obj.layout115:setTop(80);
    obj.layout115:setWidth(400);
    obj.layout115:setHeight(175);
    obj.layout115:setName("layout115");

    obj.rectangle115 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.layout115);
    obj.rectangle115:setLeft(0);
    obj.rectangle115:setTop(0);
    obj.rectangle115:setWidth(400);
    obj.rectangle115:setHeight(175);
    obj.rectangle115:setColor("black");
    obj.rectangle115:setXradius(15);
    obj.rectangle115:setYradius(15);
    obj.rectangle115:setCornerType("round");
    obj.rectangle115:setName("rectangle115");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout115);
    obj.label226:setLeft(0);
    obj.label226:setTop(0);
    obj.label226:setWidth(400);
    obj.label226:setHeight(20);
    obj.label226:setText("Aparencia");
    obj.label226:setHorzTextAlign("center");
    obj.label226:setName("label226");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout115);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(135);
    obj.textEditor5:setField("aparencia");
    obj.textEditor5:setName("textEditor5");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.scrollBox6);
    obj.layout116:setLeft(0);
    obj.layout116:setTop(260);
    obj.layout116:setWidth(400);
    obj.layout116:setHeight(175);
    obj.layout116:setName("layout116");

    obj.rectangle116 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.layout116);
    obj.rectangle116:setLeft(0);
    obj.rectangle116:setTop(0);
    obj.rectangle116:setWidth(400);
    obj.rectangle116:setHeight(175);
    obj.rectangle116:setColor("black");
    obj.rectangle116:setXradius(15);
    obj.rectangle116:setYradius(15);
    obj.rectangle116:setCornerType("round");
    obj.rectangle116:setName("rectangle116");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout116);
    obj.label227:setLeft(0);
    obj.label227:setTop(0);
    obj.label227:setWidth(400);
    obj.label227:setHeight(20);
    obj.label227:setText("Personalidade");
    obj.label227:setHorzTextAlign("center");
    obj.label227:setName("label227");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout116);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(135);
    obj.textEditor6:setField("personalidade");
    obj.textEditor6:setName("textEditor6");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.scrollBox6);
    obj.layout117:setLeft(0);
    obj.layout117:setTop(440);
    obj.layout117:setWidth(400);
    obj.layout117:setHeight(175);
    obj.layout117:setName("layout117");

    obj.rectangle117 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout117);
    obj.rectangle117:setLeft(0);
    obj.rectangle117:setTop(0);
    obj.rectangle117:setWidth(400);
    obj.rectangle117:setHeight(175);
    obj.rectangle117:setColor("black");
    obj.rectangle117:setXradius(15);
    obj.rectangle117:setYradius(15);
    obj.rectangle117:setCornerType("round");
    obj.rectangle117:setName("rectangle117");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout117);
    obj.label228:setLeft(0);
    obj.label228:setTop(0);
    obj.label228:setWidth(400);
    obj.label228:setHeight(20);
    obj.label228:setText("Idiomas");
    obj.label228:setHorzTextAlign("center");
    obj.label228:setName("label228");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout117);
    obj.textEditor7:setLeft(10);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(380);
    obj.textEditor7:setHeight(135);
    obj.textEditor7:setField("idiomas");
    obj.textEditor7:setName("textEditor7");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.scrollBox6);
    obj.layout118:setLeft(410);
    obj.layout118:setTop(80);
    obj.layout118:setWidth(800);
    obj.layout118:setHeight(535);
    obj.layout118:setName("layout118");

    obj.rectangle118 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.layout118);
    obj.rectangle118:setLeft(0);
    obj.rectangle118:setTop(0);
    obj.rectangle118:setWidth(800);
    obj.rectangle118:setHeight(535);
    obj.rectangle118:setColor("black");
    obj.rectangle118:setXradius(15);
    obj.rectangle118:setYradius(15);
    obj.rectangle118:setCornerType("round");
    obj.rectangle118:setName("rectangle118");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout118);
    obj.label229:setLeft(0);
    obj.label229:setTop(0);
    obj.label229:setWidth(800);
    obj.label229:setHeight(20);
    obj.label229:setText("Historia");
    obj.label229:setHorzTextAlign("center");
    obj.label229:setName("label229");

    obj.button157 = GUI.fromHandle(_obj_newObject("button"));
    obj.button157:setParent(obj.layout118);
    obj.button157:setLeft(695);
    obj.button157:setTop(1);
    obj.button157:setWidth(100);
    obj.button157:setHeight(20);
    obj.button157:setText("Copiar Antigo");
    obj.button157:setName("button157");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout118);
    obj.richEdit1:setLeft(10);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(780);
    obj.richEdit1:setHeight(495);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmACN5 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN5:setParent(obj.tab5);
    obj.frmACN5:setName("frmACN5");
    obj.frmACN5:setAlign("client");
    obj.frmACN5:setTheme("dark");
    obj.frmACN5:setMargins({top=1});

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmACN5);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.scrollBox7);
    obj.layout119:setLeft(0);
    obj.layout119:setTop(0);
    obj.layout119:setWidth(400);
    obj.layout119:setHeight(580);
    obj.layout119:setName("layout119");

    obj.rectangle119 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout119);
    obj.rectangle119:setLeft(0);
    obj.rectangle119:setTop(0);
    obj.rectangle119:setWidth(400);
    obj.rectangle119:setHeight(580);
    obj.rectangle119:setColor("black");
    obj.rectangle119:setXradius(15);
    obj.rectangle119:setYradius(15);
    obj.rectangle119:setCornerType("round");
    obj.rectangle119:setName("rectangle119");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout119);
    obj.label230:setLeft(0);
    obj.label230:setTop(0);
    obj.label230:setWidth(400);
    obj.label230:setHeight(20);
    obj.label230:setText("Anotações");
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout119);
    obj.textEditor8:setLeft(10);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(380);
    obj.textEditor8:setHeight(540);
    obj.textEditor8:setField("anotacoes1");
    obj.textEditor8:setName("textEditor8");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.scrollBox7);
    obj.layout120:setLeft(410);
    obj.layout120:setTop(0);
    obj.layout120:setWidth(400);
    obj.layout120:setHeight(580);
    obj.layout120:setName("layout120");

    obj.rectangle120 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout120);
    obj.rectangle120:setLeft(0);
    obj.rectangle120:setTop(0);
    obj.rectangle120:setWidth(400);
    obj.rectangle120:setHeight(580);
    obj.rectangle120:setColor("black");
    obj.rectangle120:setXradius(15);
    obj.rectangle120:setYradius(15);
    obj.rectangle120:setCornerType("round");
    obj.rectangle120:setName("rectangle120");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout120);
    obj.label231:setLeft(0);
    obj.label231:setTop(0);
    obj.label231:setWidth(400);
    obj.label231:setHeight(20);
    obj.label231:setText("Anotações");
    obj.label231:setHorzTextAlign("center");
    obj.label231:setName("label231");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout120);
    obj.textEditor9:setLeft(10);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(380);
    obj.textEditor9:setHeight(540);
    obj.textEditor9:setField("anotacoes2");
    obj.textEditor9:setName("textEditor9");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.scrollBox7);
    obj.layout121:setLeft(820);
    obj.layout121:setTop(0);
    obj.layout121:setWidth(400);
    obj.layout121:setHeight(580);
    obj.layout121:setName("layout121");

    obj.rectangle121 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout121);
    obj.rectangle121:setLeft(0);
    obj.rectangle121:setTop(0);
    obj.rectangle121:setWidth(400);
    obj.rectangle121:setHeight(580);
    obj.rectangle121:setColor("black");
    obj.rectangle121:setXradius(15);
    obj.rectangle121:setYradius(15);
    obj.rectangle121:setCornerType("round");
    obj.rectangle121:setName("rectangle121");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout121);
    obj.label232:setLeft(0);
    obj.label232:setTop(0);
    obj.label232:setWidth(400);
    obj.label232:setHeight(20);
    obj.label232:setText("Anotações");
    obj.label232:setHorzTextAlign("center");
    obj.label232:setName("label232");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout121);
    obj.textEditor10:setLeft(10);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(380);
    obj.textEditor10:setHeight(540);
    obj.textEditor10:setField("anotacoes3");
    obj.textEditor10:setName("textEditor10");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmACN6 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmACN6:setParent(obj.tab6);
    obj.frmACN6:setName("frmACN6");
    obj.frmACN6:setAlign("client");
    obj.frmACN6:setTheme("dark");
    obj.frmACN6:setMargins({top=1});


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
			end;

			local function findAllControls()
				local controlsList = {self};
				recursiveFindControls(self, controlsList);
				
				return controlsList;
			end;

			local function filterByClass(className, controls)
				local controlsFromClass = {};

				for i=1, #controls, 1 do
					if controls[i]:getClassName() == className then
						controlsFromClass[#controlsFromClass + 1] = controls[i];
					end;
				end;

				return controlsFromClass;
			end;

			local function findClass(className)
				local controls = findAllControls();
				return filterByClass(className, controls);
			end;

		


    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmACN6);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox8);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(500);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Ficha ACN/images/RPGmeister.jpg");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox8);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(500);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Ficha ACN/images/SALEM.png");
    obj.image3:setName("image3");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.scrollBox8);
    obj.layout122:setLeft(550);
    obj.layout122:setTop(260);
    obj.layout122:setWidth(200);
    obj.layout122:setHeight(150);
    obj.layout122:setName("layout122");

    obj.rectangle122 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout122);
    obj.rectangle122:setLeft(0);
    obj.rectangle122:setTop(0);
    obj.rectangle122:setWidth(200);
    obj.rectangle122:setHeight(150);
    obj.rectangle122:setColor("black");
    obj.rectangle122:setXradius(15);
    obj.rectangle122:setYradius(15);
    obj.rectangle122:setCornerType("round");
    obj.rectangle122:setName("rectangle122");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout122);
    obj.label233:setLeft(0);
    obj.label233:setTop(10);
    obj.label233:setWidth(200);
    obj.label233:setHeight(20);
    obj.label233:setText("Programador: Vinny (Ambesek)");
    obj.label233:setHorzTextAlign("center");
    obj.label233:setName("label233");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout122);
    obj.label234:setLeft(0);
    obj.label234:setTop(35);
    obj.label234:setWidth(200);
    obj.label234:setHeight(20);
    obj.label234:setText("Arte: Nefer (Nefertyne)");
    obj.label234:setHorzTextAlign("center");
    obj.label234:setName("label234");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout122);
    obj.label235:setLeft(0);
    obj.label235:setTop(60);
    obj.label235:setWidth(200);
    obj.label235:setHeight(20);
    obj.label235:setText("Consultor: Π (Pi)");
    obj.label235:setHorzTextAlign("center");
    obj.label235:setName("label235");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout122);
    obj.label236:setLeft(0);
    obj.label236:setTop(95);
    obj.label236:setWidth(200);
    obj.label236:setHeight(20);
    obj.label236:setText("Ficha feita para a mesa SALEM");
    obj.label236:setHorzTextAlign("center");
    obj.label236:setName("label236");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout122);
    obj.label237:setLeft(0);
    obj.label237:setTop(120);
    obj.label237:setWidth(200);
    obj.label237:setHeight(20);
    obj.label237:setText("Sistema: Ao Cair da Noite");
    obj.label237:setHorzTextAlign("center");
    obj.label237:setName("label237");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox8);
    obj.layout123:setLeft(550);
    obj.layout123:setTop(420);
    obj.layout123:setWidth(200);
    obj.layout123:setHeight(150);
    obj.layout123:setName("layout123");

    obj.rectangle123 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.layout123);
    obj.rectangle123:setLeft(0);
    obj.rectangle123:setTop(0);
    obj.rectangle123:setWidth(200);
    obj.rectangle123:setHeight(150);
    obj.rectangle123:setColor("black");
    obj.rectangle123:setName("rectangle123");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout123);
    obj.label238:setLeft(0);
    obj.label238:setTop(10);
    obj.label238:setWidth(80);
    obj.label238:setHeight(20);
    obj.label238:setText("Tema:");
    obj.label238:setHorzTextAlign("center");
    obj.label238:setName("label238");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout123);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(10);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("theme");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setItems({'Escuro', 'Claro'});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setName("comboBox3");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout123);
    obj.dataLink29:setField("theme");
    obj.dataLink29:setDefaultValue("Escuro");
    obj.dataLink29:setName("dataLink29");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout123);
    obj.label239:setLeft(0);
    obj.label239:setTop(35);
    obj.label239:setWidth(90);
    obj.label239:setHeight(20);
    obj.label239:setText("Cores: ");
    obj.label239:setHorzTextAlign("center");
    obj.label239:setName("label239");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout123);
    obj.label240:setLeft(0);
    obj.label240:setTop(60);
    obj.label240:setWidth(90);
    obj.label240:setHeight(20);
    obj.label240:setText("Fundo ");
    obj.label240:setHorzTextAlign("center");
    obj.label240:setName("label240");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout123);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(60);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorBackground");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout123);
    obj.dataLink30:setField("colorBackground");
    obj.dataLink30:setDefaultValue("#000000");
    obj.dataLink30:setName("dataLink30");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout123);
    obj.label241:setLeft(0);
    obj.label241:setTop(85);
    obj.label241:setWidth(90);
    obj.label241:setHeight(20);
    obj.label241:setText("Linhas ");
    obj.label241:setHorzTextAlign("center");
    obj.label241:setName("label241");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout123);
    obj.comboBox5:setLeft(95);
    obj.comboBox5:setTop(85);
    obj.comboBox5:setWidth(90);
    obj.comboBox5:setField("colorStroke");
    obj.comboBox5:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox5:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout123);
    obj.dataLink31:setField("colorStroke");
    obj.dataLink31:setDefaultValue("#FFFFFF");
    obj.dataLink31:setName("dataLink31");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout123);
    obj.label242:setLeft(0);
    obj.label242:setTop(110);
    obj.label242:setWidth(90);
    obj.label242:setHeight(20);
    obj.label242:setText("Fonte ");
    obj.label242:setHorzTextAlign("center");
    obj.label242:setName("label242");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout123);
    obj.comboBox6:setLeft(95);
    obj.comboBox6:setTop(110);
    obj.comboBox6:setWidth(90);
    obj.comboBox6:setField("colorFont");
    obj.comboBox6:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox6:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout123);
    obj.dataLink32:setField("colorFont");
    obj.dataLink32:setDefaultValue("#FFFFFF");
    obj.dataLink32:setName("dataLink32");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.scrollBox8);
    obj.label243:setLeft(0);
    obj.label243:setTop(505);
    obj.label243:setWidth(200);
    obj.label243:setHeight(20);
    obj.label243:setText("Versão Atual: ");
    obj.label243:setHorzTextAlign("leading");
    obj.label243:setField("versionInstalled");
    obj.label243:setName("label243");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.scrollBox8);
    obj.label244:setLeft(0);
    obj.label244:setTop(530);
    obj.label244:setWidth(200);
    obj.label244:setHeight(20);
    obj.label244:setText("Sua Versão: ");
    obj.label244:setHorzTextAlign("leading");
    obj.label244:setField("versionDownloaded");
    obj.label244:setName("label244");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.scrollBox8);
    obj.checkBox46:setLeft(0);
    obj.checkBox46:setTop(555);
    obj.checkBox46:setWidth(200);
    obj.checkBox46:setHeight(20);
    obj.checkBox46:setField("noUpdate");
    obj.checkBox46:setText("Não pedir para atualizar.");
    obj.checkBox46:setName("checkBox46");

    obj.button158 = GUI.fromHandle(_obj_newObject("button"));
    obj.button158:setParent(obj.scrollBox8);
    obj.button158:setLeft(180);
    obj.button158:setTop(505);
    obj.button158:setWidth(100);
    obj.button158:setText("Change Log");
    obj.button158:setName("button158");

    obj.button159 = GUI.fromHandle(_obj_newObject("button"));
    obj.button159:setParent(obj.scrollBox8);
    obj.button159:setLeft(180);
    obj.button159:setTop(530);
    obj.button159:setWidth(100);
    obj.button159:setText("Atualizar");
    obj.button159:setName("button159");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.scrollBox8);
    obj.label245:setLeft(305);
    obj.label245:setTop(505);
    obj.label245:setWidth(200);
    obj.label245:setHeight(20);
    obj.label245:setText("Conheça as Mesas:");
    obj.label245:setName("label245");

    obj.button160 = GUI.fromHandle(_obj_newObject("button"));
    obj.button160:setParent(obj.scrollBox8);
    obj.button160:setLeft(305);
    obj.button160:setTop(530);
    obj.button160:setWidth(100);
    obj.button160:setText("RPGmeister");
    obj.button160:setName("button160");

    obj.button161 = GUI.fromHandle(_obj_newObject("button"));
    obj.button161:setParent(obj.scrollBox8);
    obj.button161:setLeft(410);
    obj.button161:setTop(530);
    obj.button161:setWidth(100);
    obj.button161:setText("SALEM");
    obj.button161:setName("button161");

    obj.button162 = GUI.fromHandle(_obj_newObject("button"));
    obj.button162:setParent(obj.scrollBox8);
    obj.button162:setLeft(180);
    obj.button162:setTop(555);
    obj.button162:setWidth(100);
    obj.button162:setHeight(20);
    obj.button162:setText("Exportar Ficha");
    obj.button162:setName("button162");

    obj.button163 = GUI.fromHandle(_obj_newObject("button"));
    obj.button163:setParent(obj.scrollBox8);
    obj.button163:setLeft(180);
    obj.button163:setTop(580);
    obj.button163:setWidth(100);
    obj.button163:setHeight(20);
    obj.button163:setText("Importar Ficha");
    obj.button163:setName("button163");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.scrollBox8);
    obj.layout124:setLeft(760);
    obj.layout124:setTop(260);
    obj.layout124:setWidth(315);
    obj.layout124:setHeight(295);
    obj.layout124:setName("layout124");

    obj.rectangle124 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.layout124);
    obj.rectangle124:setAlign("client");
    obj.rectangle124:setColor("black");
    obj.rectangle124:setXradius(15);
    obj.rectangle124:setYradius(15);
    obj.rectangle124:setCornerType("round");
    obj.rectangle124:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle124:setName("rectangle124");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle124);
    obj.layout125:setAlign("top");
    obj.layout125:setHeight(25);
    obj.layout125:setName("layout125");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout125);
    obj.label246:setAlign("left");
    obj.label246:setWidth(75);
    obj.label246:setText("");
    obj.label246:setMargins({right=5});
    obj.label246:setName("label246");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout125);
    obj.label247:setAlign("left");
    obj.label247:setWidth(40);
    obj.label247:setText("Inic");
    obj.label247:setMargins({right=5});
    obj.label247:setHorzTextAlign("center");
    obj.label247:setName("label247");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout125);
    obj.label248:setAlign("left");
    obj.label248:setWidth(85);
    obj.label248:setText("Aprimoramento");
    obj.label248:setMargins({right=5});
    obj.label248:setHorzTextAlign("center");
    obj.label248:setFontSize(11);
    obj.label248:setName("label248");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout125);
    obj.label249:setAlign("left");
    obj.label249:setWidth(85);
    obj.label249:setText("XP");
    obj.label249:setMargins({right=5});
    obj.label249:setHorzTextAlign("center");
    obj.label249:setName("label249");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle124);
    obj.layout126:setAlign("top");
    obj.layout126:setHeight(25);
    obj.layout126:setName("layout126");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout126);
    obj.label250:setAlign("left");
    obj.label250:setWidth(75);
    obj.label250:setText("Atr. Físico");
    obj.label250:setMargins({right=5});
    obj.label250:setName("label250");

    obj.rectangle125 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.layout126);
    obj.rectangle125:setAlign("left");
    obj.rectangle125:setWidth(40);
    obj.rectangle125:setColor("black");
    obj.rectangle125:setStrokeColor("white");
    obj.rectangle125:setStrokeSize(1);
    obj.rectangle125:setMargins({right=5});
    obj.rectangle125:setName("rectangle125");

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.rectangle125);
    obj.label251:setAlign("client");
    obj.label251:setField("auditini_atrFis");
    obj.label251:setHorzTextAlign("center");
    obj.label251:setName("label251");

    obj.edit420 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit420:setParent(obj.layout126);
    obj.edit420:setAlign("left");
    obj.edit420:setWidth(40);
    obj.edit420:setField("auditbonuscost_atrFis");
    obj.edit420:setMargins({right=5});
    obj.edit420:setType("float");
    obj.edit420:setDecimalPlaces(1);
    obj.edit420:setName("edit420");

    obj.rectangle126 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.layout126);
    obj.rectangle126:setAlign("left");
    obj.rectangle126:setWidth(40);
    obj.rectangle126:setColor("black");
    obj.rectangle126:setStrokeColor("white");
    obj.rectangle126:setStrokeSize(1);
    obj.rectangle126:setMargins({right=5});
    obj.rectangle126:setName("rectangle126");

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.rectangle126);
    obj.label252:setAlign("client");
    obj.label252:setField("auditbonus_atrFis");
    obj.label252:setHorzTextAlign("center");
    obj.label252:setName("label252");

    obj.edit421 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit421:setParent(obj.layout126);
    obj.edit421:setAlign("left");
    obj.edit421:setWidth(40);
    obj.edit421:setField("auditxpcost_atrFis");
    obj.edit421:setMargins({right=5});
    obj.edit421:setType("float");
    obj.edit421:setDecimalPlaces(1);
    obj.edit421:setName("edit421");

    obj.rectangle127 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.layout126);
    obj.rectangle127:setAlign("left");
    obj.rectangle127:setWidth(40);
    obj.rectangle127:setColor("black");
    obj.rectangle127:setStrokeColor("white");
    obj.rectangle127:setStrokeSize(1);
    obj.rectangle127:setMargins({right=5});
    obj.rectangle127:setName("rectangle127");

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.rectangle127);
    obj.label253:setAlign("client");
    obj.label253:setField("auditxp_atrFis");
    obj.label253:setHorzTextAlign("center");
    obj.label253:setName("label253");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.rectangle124);
    obj.dataLink33:setField("auditbonuscost_atrFis");
    obj.dataLink33:setDefaultValue("3");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.rectangle124);
    obj.dataLink34:setField("auditxpcost_atrFis");
    obj.dataLink34:setDefaultValue("3");
    obj.dataLink34:setName("dataLink34");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle124);
    obj.layout127:setAlign("top");
    obj.layout127:setHeight(25);
    obj.layout127:setName("layout127");

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.layout127);
    obj.label254:setAlign("left");
    obj.label254:setWidth(75);
    obj.label254:setText("Atr. Mental");
    obj.label254:setMargins({right=5});
    obj.label254:setName("label254");

    obj.rectangle128 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.layout127);
    obj.rectangle128:setAlign("left");
    obj.rectangle128:setWidth(40);
    obj.rectangle128:setColor("black");
    obj.rectangle128:setStrokeColor("white");
    obj.rectangle128:setStrokeSize(1);
    obj.rectangle128:setMargins({right=5});
    obj.rectangle128:setName("rectangle128");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.rectangle128);
    obj.label255:setAlign("client");
    obj.label255:setField("auditini_atrMen");
    obj.label255:setHorzTextAlign("center");
    obj.label255:setName("label255");

    obj.edit422 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit422:setParent(obj.layout127);
    obj.edit422:setAlign("left");
    obj.edit422:setWidth(40);
    obj.edit422:setField("auditbonuscost_atrMen");
    obj.edit422:setMargins({right=5});
    obj.edit422:setType("float");
    obj.edit422:setDecimalPlaces(1);
    obj.edit422:setName("edit422");

    obj.rectangle129 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.layout127);
    obj.rectangle129:setAlign("left");
    obj.rectangle129:setWidth(40);
    obj.rectangle129:setColor("black");
    obj.rectangle129:setStrokeColor("white");
    obj.rectangle129:setStrokeSize(1);
    obj.rectangle129:setMargins({right=5});
    obj.rectangle129:setName("rectangle129");

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.rectangle129);
    obj.label256:setAlign("client");
    obj.label256:setField("auditbonus_atrMen");
    obj.label256:setHorzTextAlign("center");
    obj.label256:setName("label256");

    obj.edit423 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit423:setParent(obj.layout127);
    obj.edit423:setAlign("left");
    obj.edit423:setWidth(40);
    obj.edit423:setField("auditxpcost_atrMen");
    obj.edit423:setMargins({right=5});
    obj.edit423:setType("float");
    obj.edit423:setDecimalPlaces(1);
    obj.edit423:setName("edit423");

    obj.rectangle130 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.layout127);
    obj.rectangle130:setAlign("left");
    obj.rectangle130:setWidth(40);
    obj.rectangle130:setColor("black");
    obj.rectangle130:setStrokeColor("white");
    obj.rectangle130:setStrokeSize(1);
    obj.rectangle130:setMargins({right=5});
    obj.rectangle130:setName("rectangle130");

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.rectangle130);
    obj.label257:setAlign("client");
    obj.label257:setField("auditxp_atrMen");
    obj.label257:setHorzTextAlign("center");
    obj.label257:setName("label257");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.rectangle124);
    obj.dataLink35:setField("auditbonuscost_atrMen");
    obj.dataLink35:setDefaultValue("3");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.rectangle124);
    obj.dataLink36:setField("auditxpcost_atrMen");
    obj.dataLink36:setDefaultValue("3");
    obj.dataLink36:setName("dataLink36");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle124);
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(25);
    obj.layout128:setName("layout128");

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.layout128);
    obj.label258:setAlign("left");
    obj.label258:setWidth(75);
    obj.label258:setText("Apt. Físico");
    obj.label258:setMargins({right=5});
    obj.label258:setName("label258");

    obj.rectangle131 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.layout128);
    obj.rectangle131:setAlign("left");
    obj.rectangle131:setWidth(40);
    obj.rectangle131:setColor("black");
    obj.rectangle131:setStrokeColor("white");
    obj.rectangle131:setStrokeSize(1);
    obj.rectangle131:setMargins({right=5});
    obj.rectangle131:setName("rectangle131");

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.rectangle131);
    obj.label259:setAlign("client");
    obj.label259:setField("auditini_aptFis");
    obj.label259:setHorzTextAlign("center");
    obj.label259:setName("label259");

    obj.edit424 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit424:setParent(obj.layout128);
    obj.edit424:setAlign("left");
    obj.edit424:setWidth(40);
    obj.edit424:setField("auditbonuscost_aptFis");
    obj.edit424:setMargins({right=5});
    obj.edit424:setType("float");
    obj.edit424:setDecimalPlaces(1);
    obj.edit424:setName("edit424");

    obj.rectangle132 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.layout128);
    obj.rectangle132:setAlign("left");
    obj.rectangle132:setWidth(40);
    obj.rectangle132:setColor("black");
    obj.rectangle132:setStrokeColor("white");
    obj.rectangle132:setStrokeSize(1);
    obj.rectangle132:setMargins({right=5});
    obj.rectangle132:setName("rectangle132");

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.rectangle132);
    obj.label260:setAlign("client");
    obj.label260:setField("auditbonus_aptFis");
    obj.label260:setHorzTextAlign("center");
    obj.label260:setName("label260");

    obj.edit425 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit425:setParent(obj.layout128);
    obj.edit425:setAlign("left");
    obj.edit425:setWidth(40);
    obj.edit425:setField("auditxpcost_aptFis");
    obj.edit425:setMargins({right=5});
    obj.edit425:setType("float");
    obj.edit425:setDecimalPlaces(1);
    obj.edit425:setName("edit425");

    obj.rectangle133 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.layout128);
    obj.rectangle133:setAlign("left");
    obj.rectangle133:setWidth(40);
    obj.rectangle133:setColor("black");
    obj.rectangle133:setStrokeColor("white");
    obj.rectangle133:setStrokeSize(1);
    obj.rectangle133:setMargins({right=5});
    obj.rectangle133:setName("rectangle133");

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.rectangle133);
    obj.label261:setAlign("client");
    obj.label261:setField("auditxp_aptFis");
    obj.label261:setHorzTextAlign("center");
    obj.label261:setName("label261");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.rectangle124);
    obj.dataLink37:setField("auditbonuscost_aptFis");
    obj.dataLink37:setDefaultValue("1");
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.rectangle124);
    obj.dataLink38:setField("auditxpcost_aptFis");
    obj.dataLink38:setDefaultValue("1.5");
    obj.dataLink38:setName("dataLink38");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle124);
    obj.layout129:setAlign("top");
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.layout129);
    obj.label262:setAlign("left");
    obj.label262:setWidth(75);
    obj.label262:setText("Apt. Mental");
    obj.label262:setMargins({right=5});
    obj.label262:setName("label262");

    obj.rectangle134 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.layout129);
    obj.rectangle134:setAlign("left");
    obj.rectangle134:setWidth(40);
    obj.rectangle134:setColor("black");
    obj.rectangle134:setStrokeColor("white");
    obj.rectangle134:setStrokeSize(1);
    obj.rectangle134:setMargins({right=5});
    obj.rectangle134:setName("rectangle134");

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.rectangle134);
    obj.label263:setAlign("client");
    obj.label263:setField("auditini_aptMen");
    obj.label263:setHorzTextAlign("center");
    obj.label263:setName("label263");

    obj.edit426 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit426:setParent(obj.layout129);
    obj.edit426:setAlign("left");
    obj.edit426:setWidth(40);
    obj.edit426:setField("auditbonuscost_aptMen");
    obj.edit426:setMargins({right=5});
    obj.edit426:setType("float");
    obj.edit426:setDecimalPlaces(1);
    obj.edit426:setName("edit426");

    obj.rectangle135 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.layout129);
    obj.rectangle135:setAlign("left");
    obj.rectangle135:setWidth(40);
    obj.rectangle135:setColor("black");
    obj.rectangle135:setStrokeColor("white");
    obj.rectangle135:setStrokeSize(1);
    obj.rectangle135:setMargins({right=5});
    obj.rectangle135:setName("rectangle135");

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.rectangle135);
    obj.label264:setAlign("client");
    obj.label264:setField("auditbonus_aptMen");
    obj.label264:setHorzTextAlign("center");
    obj.label264:setName("label264");

    obj.edit427 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit427:setParent(obj.layout129);
    obj.edit427:setAlign("left");
    obj.edit427:setWidth(40);
    obj.edit427:setField("auditxpcost_aptMen");
    obj.edit427:setMargins({right=5});
    obj.edit427:setType("float");
    obj.edit427:setDecimalPlaces(1);
    obj.edit427:setName("edit427");

    obj.rectangle136 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle136:setParent(obj.layout129);
    obj.rectangle136:setAlign("left");
    obj.rectangle136:setWidth(40);
    obj.rectangle136:setColor("black");
    obj.rectangle136:setStrokeColor("white");
    obj.rectangle136:setStrokeSize(1);
    obj.rectangle136:setMargins({right=5});
    obj.rectangle136:setName("rectangle136");

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.rectangle136);
    obj.label265:setAlign("client");
    obj.label265:setField("auditxp_aptMen");
    obj.label265:setHorzTextAlign("center");
    obj.label265:setName("label265");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.rectangle124);
    obj.dataLink39:setField("auditbonuscost_aptMen");
    obj.dataLink39:setDefaultValue("1");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.rectangle124);
    obj.dataLink40:setField("auditxpcost_aptMen");
    obj.dataLink40:setDefaultValue("1.5");
    obj.dataLink40:setName("dataLink40");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle124);
    obj.layout130:setAlign("top");
    obj.layout130:setHeight(25);
    obj.layout130:setName("layout130");

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.layout130);
    obj.label266:setAlign("left");
    obj.label266:setWidth(75);
    obj.label266:setText("Especialização");
    obj.label266:setMargins({right=5});
    obj.label266:setFontSize(11);
    obj.label266:setName("label266");

    obj.edit428 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit428:setParent(obj.layout130);
    obj.edit428:setAlign("left");
    obj.edit428:setWidth(40);
    obj.edit428:setField("auditini_espec");
    obj.edit428:setMargins({right=5});
    obj.edit428:setName("edit428");

    obj.edit429 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit429:setParent(obj.layout130);
    obj.edit429:setAlign("left");
    obj.edit429:setWidth(40);
    obj.edit429:setField("auditbonuscost_espec");
    obj.edit429:setMargins({right=5});
    obj.edit429:setName("edit429");

    obj.edit430 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit430:setParent(obj.layout130);
    obj.edit430:setAlign("left");
    obj.edit430:setWidth(40);
    obj.edit430:setField("auditbonus_espec");
    obj.edit430:setMargins({right=5});
    obj.edit430:setName("edit430");

    obj.edit431 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit431:setParent(obj.layout130);
    obj.edit431:setAlign("left");
    obj.edit431:setWidth(40);
    obj.edit431:setField("auditxpcost_espec");
    obj.edit431:setMargins({right=5});
    obj.edit431:setName("edit431");

    obj.edit432 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit432:setParent(obj.layout130);
    obj.edit432:setAlign("left");
    obj.edit432:setWidth(40);
    obj.edit432:setField("auditxp_espec");
    obj.edit432:setName("edit432");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle124);
    obj.layout131:setAlign("top");
    obj.layout131:setHeight(25);
    obj.layout131:setName("layout131");

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.layout131);
    obj.label267:setAlign("left");
    obj.label267:setWidth(75);
    obj.label267:setText("Historico");
    obj.label267:setMargins({right=5});
    obj.label267:setName("label267");

    obj.rectangle137 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle137:setParent(obj.layout131);
    obj.rectangle137:setAlign("left");
    obj.rectangle137:setWidth(40);
    obj.rectangle137:setColor("black");
    obj.rectangle137:setStrokeColor("white");
    obj.rectangle137:setStrokeSize(1);
    obj.rectangle137:setMargins({right=5});
    obj.rectangle137:setName("rectangle137");

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.rectangle137);
    obj.label268:setAlign("client");
    obj.label268:setField("auditini_hist");
    obj.label268:setHorzTextAlign("center");
    obj.label268:setName("label268");

    obj.edit433 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit433:setParent(obj.layout131);
    obj.edit433:setAlign("left");
    obj.edit433:setWidth(40);
    obj.edit433:setField("auditbonuscost_hist");
    obj.edit433:setMargins({right=5});
    obj.edit433:setType("float");
    obj.edit433:setDecimalPlaces(1);
    obj.edit433:setName("edit433");

    obj.rectangle138 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle138:setParent(obj.layout131);
    obj.rectangle138:setAlign("left");
    obj.rectangle138:setWidth(40);
    obj.rectangle138:setColor("black");
    obj.rectangle138:setStrokeColor("white");
    obj.rectangle138:setStrokeSize(1);
    obj.rectangle138:setMargins({right=5});
    obj.rectangle138:setName("rectangle138");

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.rectangle138);
    obj.label269:setAlign("client");
    obj.label269:setField("auditbonus_hist");
    obj.label269:setHorzTextAlign("center");
    obj.label269:setName("label269");

    obj.edit434 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit434:setParent(obj.layout131);
    obj.edit434:setAlign("left");
    obj.edit434:setWidth(40);
    obj.edit434:setField("auditxpcost_hist");
    obj.edit434:setMargins({right=5});
    obj.edit434:setType("float");
    obj.edit434:setDecimalPlaces(1);
    obj.edit434:setName("edit434");

    obj.rectangle139 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle139:setParent(obj.layout131);
    obj.rectangle139:setAlign("left");
    obj.rectangle139:setWidth(40);
    obj.rectangle139:setColor("black");
    obj.rectangle139:setStrokeColor("white");
    obj.rectangle139:setStrokeSize(1);
    obj.rectangle139:setMargins({right=5});
    obj.rectangle139:setName("rectangle139");

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.rectangle139);
    obj.label270:setAlign("client");
    obj.label270:setField("auditxp_hist");
    obj.label270:setHorzTextAlign("center");
    obj.label270:setName("label270");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle124);
    obj.dataLink41:setField("auditbonuscost_hist");
    obj.dataLink41:setDefaultValue("1");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.rectangle124);
    obj.dataLink42:setField("auditxpcost_hist");
    obj.dataLink42:setDefaultValue("2");
    obj.dataLink42:setName("dataLink42");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle124);
    obj.layout132:setAlign("top");
    obj.layout132:setHeight(25);
    obj.layout132:setName("layout132");

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.layout132);
    obj.label271:setAlign("left");
    obj.label271:setWidth(75);
    obj.label271:setText("Eidolon");
    obj.label271:setMargins({right=5});
    obj.label271:setName("label271");

    obj.rectangle140 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle140:setParent(obj.layout132);
    obj.rectangle140:setAlign("left");
    obj.rectangle140:setWidth(40);
    obj.rectangle140:setColor("black");
    obj.rectangle140:setStrokeColor("white");
    obj.rectangle140:setStrokeSize(1);
    obj.rectangle140:setMargins({right=5});
    obj.rectangle140:setName("rectangle140");

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.rectangle140);
    obj.label272:setAlign("client");
    obj.label272:setField("auditini_eido");
    obj.label272:setHorzTextAlign("center");
    obj.label272:setName("label272");

    obj.edit435 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit435:setParent(obj.layout132);
    obj.edit435:setAlign("left");
    obj.edit435:setWidth(40);
    obj.edit435:setField("auditbonuscost_eido");
    obj.edit435:setMargins({right=5});
    obj.edit435:setType("float");
    obj.edit435:setDecimalPlaces(1);
    obj.edit435:setName("edit435");

    obj.rectangle141 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle141:setParent(obj.layout132);
    obj.rectangle141:setAlign("left");
    obj.rectangle141:setWidth(40);
    obj.rectangle141:setColor("black");
    obj.rectangle141:setStrokeColor("white");
    obj.rectangle141:setStrokeSize(1);
    obj.rectangle141:setMargins({right=5});
    obj.rectangle141:setName("rectangle141");

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.rectangle141);
    obj.label273:setAlign("client");
    obj.label273:setField("auditbonus_eido");
    obj.label273:setHorzTextAlign("center");
    obj.label273:setName("label273");

    obj.edit436 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit436:setParent(obj.layout132);
    obj.edit436:setAlign("left");
    obj.edit436:setWidth(40);
    obj.edit436:setField("auditxpcost_eido");
    obj.edit436:setMargins({right=5});
    obj.edit436:setType("float");
    obj.edit436:setDecimalPlaces(1);
    obj.edit436:setName("edit436");

    obj.rectangle142 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle142:setParent(obj.layout132);
    obj.rectangle142:setAlign("left");
    obj.rectangle142:setWidth(40);
    obj.rectangle142:setColor("black");
    obj.rectangle142:setStrokeColor("white");
    obj.rectangle142:setStrokeSize(1);
    obj.rectangle142:setMargins({right=5});
    obj.rectangle142:setName("rectangle142");

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.rectangle142);
    obj.label274:setAlign("client");
    obj.label274:setField("auditxp_eido");
    obj.label274:setHorzTextAlign("center");
    obj.label274:setName("label274");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.rectangle124);
    obj.dataLink43:setField("auditbonuscost_eido");
    obj.dataLink43:setDefaultValue("2");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.rectangle124);
    obj.dataLink44:setField("auditxpcost_eido");
    obj.dataLink44:setDefaultValue("1");
    obj.dataLink44:setName("dataLink44");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle124);
    obj.layout133:setAlign("top");
    obj.layout133:setHeight(25);
    obj.layout133:setName("layout133");

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.layout133);
    obj.label275:setAlign("left");
    obj.label275:setWidth(75);
    obj.label275:setText("Outros");
    obj.label275:setMargins({right=5});
    obj.label275:setName("label275");

    obj.rectangle143 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle143:setParent(obj.layout133);
    obj.rectangle143:setAlign("left");
    obj.rectangle143:setWidth(40);
    obj.rectangle143:setColor("black");
    obj.rectangle143:setStrokeColor("white");
    obj.rectangle143:setStrokeSize(1);
    obj.rectangle143:setMargins({right=5});
    obj.rectangle143:setName("rectangle143");

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.rectangle143);
    obj.label276:setAlign("client");
    obj.label276:setField("auditini_out");
    obj.label276:setHorzTextAlign("center");
    obj.label276:setName("label276");

    obj.edit437 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit437:setParent(obj.layout133);
    obj.edit437:setAlign("left");
    obj.edit437:setWidth(40);
    obj.edit437:setField("auditbonuscost_out");
    obj.edit437:setMargins({right=5});
    obj.edit437:setType("float");
    obj.edit437:setDecimalPlaces(1);
    obj.edit437:setName("edit437");

    obj.rectangle144 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle144:setParent(obj.layout133);
    obj.rectangle144:setAlign("left");
    obj.rectangle144:setWidth(40);
    obj.rectangle144:setColor("black");
    obj.rectangle144:setStrokeColor("white");
    obj.rectangle144:setStrokeSize(1);
    obj.rectangle144:setMargins({right=5});
    obj.rectangle144:setName("rectangle144");

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.rectangle144);
    obj.label277:setAlign("client");
    obj.label277:setField("auditbonus_out");
    obj.label277:setHorzTextAlign("center");
    obj.label277:setName("label277");

    obj.edit438 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit438:setParent(obj.layout133);
    obj.edit438:setAlign("left");
    obj.edit438:setWidth(40);
    obj.edit438:setField("auditxpcost_out");
    obj.edit438:setMargins({right=5});
    obj.edit438:setType("float");
    obj.edit438:setDecimalPlaces(1);
    obj.edit438:setName("edit438");

    obj.rectangle145 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle145:setParent(obj.layout133);
    obj.rectangle145:setAlign("left");
    obj.rectangle145:setWidth(40);
    obj.rectangle145:setColor("black");
    obj.rectangle145:setStrokeColor("white");
    obj.rectangle145:setStrokeSize(1);
    obj.rectangle145:setMargins({right=5});
    obj.rectangle145:setName("rectangle145");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.rectangle145);
    obj.label278:setAlign("client");
    obj.label278:setField("auditxp_out");
    obj.label278:setHorzTextAlign("center");
    obj.label278:setName("label278");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.rectangle124);
    obj.dataLink45:setField("auditbonuscost_out");
    obj.dataLink45:setDefaultValue("5");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.rectangle124);
    obj.dataLink46:setField("auditxpcost_out");
    obj.dataLink46:setDefaultValue("5");
    obj.dataLink46:setName("dataLink46");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle124);
    obj.layout134:setAlign("top");
    obj.layout134:setHeight(25);
    obj.layout134:setName("layout134");

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.layout134);
    obj.label279:setAlign("left");
    obj.label279:setWidth(75);
    obj.label279:setText("Extra");
    obj.label279:setMargins({right=5});
    obj.label279:setName("label279");

    obj.edit439 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit439:setParent(obj.layout134);
    obj.edit439:setAlign("left");
    obj.edit439:setWidth(40);
    obj.edit439:setField("auditini_extra");
    obj.edit439:setMargins({right=5});
    obj.edit439:setName("edit439");

    obj.edit440 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit440:setParent(obj.layout134);
    obj.edit440:setAlign("left");
    obj.edit440:setWidth(40);
    obj.edit440:setField("auditbonuscost_extra");
    obj.edit440:setMargins({right=5});
    obj.edit440:setName("edit440");

    obj.edit441 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit441:setParent(obj.layout134);
    obj.edit441:setAlign("left");
    obj.edit441:setWidth(40);
    obj.edit441:setField("auditbonus_extra");
    obj.edit441:setMargins({right=5});
    obj.edit441:setName("edit441");

    obj.edit442 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit442:setParent(obj.layout134);
    obj.edit442:setAlign("left");
    obj.edit442:setWidth(40);
    obj.edit442:setField("auditxpcost_extra");
    obj.edit442:setMargins({right=5});
    obj.edit442:setName("edit442");

    obj.edit443 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit443:setParent(obj.layout134);
    obj.edit443:setAlign("left");
    obj.edit443:setWidth(40);
    obj.edit443:setField("auditxp_extra");
    obj.edit443:setName("edit443");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle124);
    obj.layout135:setAlign("top");
    obj.layout135:setHeight(25);
    obj.layout135:setName("layout135");

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.layout135);
    obj.label280:setAlign("left");
    obj.label280:setWidth(75);
    obj.label280:setText("Total");
    obj.label280:setMargins({right=5});
    obj.label280:setName("label280");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout135);
    obj.layout136:setAlign("left");
    obj.layout136:setWidth(40);
    obj.layout136:setMargins({right=5});
    obj.layout136:setName("layout136");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout135);
    obj.layout137:setAlign("left");
    obj.layout137:setWidth(40);
    obj.layout137:setMargins({right=5});
    obj.layout137:setName("layout137");

    obj.rectangle146 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle146:setParent(obj.layout135);
    obj.rectangle146:setAlign("left");
    obj.rectangle146:setWidth(40);
    obj.rectangle146:setColor("black");
    obj.rectangle146:setStrokeColor("white");
    obj.rectangle146:setStrokeSize(1);
    obj.rectangle146:setMargins({right=5});
    obj.rectangle146:setName("rectangle146");

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.rectangle146);
    obj.label281:setAlign("client");
    obj.label281:setField("auditbonus_total");
    obj.label281:setHorzTextAlign("center");
    obj.label281:setName("label281");

    obj.edit444 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit444:setParent(obj.layout135);
    obj.edit444:setAlign("left");
    obj.edit444:setWidth(40);
    obj.edit444:setField("XP");
    obj.edit444:setName("edit444");

    obj.rectangle147 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle147:setParent(obj.layout135);
    obj.rectangle147:setAlign("left");
    obj.rectangle147:setWidth(40);
    obj.rectangle147:setColor("black");
    obj.rectangle147:setStrokeColor("white");
    obj.rectangle147:setStrokeSize(1);
    obj.rectangle147:setMargins({right=5});
    obj.rectangle147:setName("rectangle147");

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.rectangle147);
    obj.label282:setAlign("client");
    obj.label282:setField("auditxp_total");
    obj.label282:setHorzTextAlign("center");
    obj.label282:setName("label282");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout124);
    obj.dataLink47:setFields({'inicialforca', 'inicialagilidade', 'inicialresiliencia'});
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout124);
    obj.dataLink48:setFields({'bonusforca', 'bonusagilidade', 'bonusresiliencia','auditbonuscost_atrFis'});
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout124);
    obj.dataLink49:setFields({'xpforca', 'xpagilidade', 'xpresiliencia', 'testeforca', 'testeagilidade', 'testeresiliencia','auditxpcost_atrFis'});
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout124);
    obj.dataLink50:setFields({'inicialcarisma', 'inicialpercepcao', 'inicialperspicacia'});
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout124);
    obj.dataLink51:setFields({'bonuscarisma', 'bonuspercepcao', 'bonusperspicacia','auditbonuscost_atrMen'});
    obj.dataLink51:setName("dataLink51");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout124);
    obj.dataLink52:setFields({'xpcarisma', 'xppercepcao', 'xpperspicacia', 'testecarisma', 'testepercepcao', 'testeperspicacia','auditxpcost_atrMen'});
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout124);
    obj.dataLink53:setFields({'base0_1', 'base0_2', 'base0_3', 'base0_4', 'base0_5', 'base0_6', 'base0_7', 'base0_8', 'base0_9', 'base0_10', 'base0_11', 'base0_12', 'base2_1', 'base2_2', 'base2_3', 'base2_4', 'base2_5', 'base2_6', 'base2_7', 'base2_8', 'base2_9', 'base2_10', 'base2_11', 'base2_12'});
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout124);
    obj.dataLink54:setFields({'bonus0_1', 'bonus0_2', 'bonus0_3', 'bonus0_4', 'bonus0_5', 'bonus0_6', 'bonus0_7', 'bonus0_8', 'bonus0_9', 'bonus0_10', 'bonus0_11', 'bonus0_12', 'bonus2_1', 'bonus2_2', 'bonus2_3', 'bonus2_4', 'bonus2_5', 'bonus2_6', 'bonus2_7', 'bonus2_8', 'bonus2_9', 'bonus2_10', 'bonus2_11', 'bonus2_12','auditbonuscost_aptFis'});
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout124);
    obj.dataLink55:setFields({'xp0_1', 'xp0_2', 'xp0_3', 'xp0_4', 'xp0_5', 'xp0_6', 'xp0_7', 'xp0_8', 'xp0_9', 'xp0_10', 'xp0_11', 'xp0_12', 'xp2_1', 'xp2_2', 'xp2_3', 'xp2_4', 'xp2_5', 'xp2_6', 'xp2_7', 'xp2_8', 'xp2_9', 'xp2_10', 'xp2_11', 'xp2_12', 'total0_1', 'total0_2', 'total0_3', 'total0_4', 'total0_5', 'total0_6', 'total0_7', 'total0_8', 'total0_9', 'total0_10', 'total0_11', 'total0_12', 'total2_1', 'total2_2', 'total2_3', 'total2_4', 'total2_5', 'total2_6', 'total2_7', 'total2_8', 'total2_9', 'total2_10', 'total2_11', 'total2_12','auditxpcost_aptFis'});
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout124);
    obj.dataLink56:setFields({'base1_1', 'base1_2', 'base1_3', 'base1_4', 'base1_5', 'base1_6', 'base1_7', 'base1_8', 'base1_9', 'base1_10', 'base1_11', 'base1_12', 'base3_1', 'base3_2', 'base3_3', 'base3_4', 'base3_5', 'base3_6', 'base3_7', 'base3_8', 'base3_9', 'base3_10', 'base3_11', 'base3_12'});
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout124);
    obj.dataLink57:setFields({'bonus1_1', 'bonus1_2', 'bonus1_3', 'bonus1_4', 'bonus1_5', 'bonus1_6', 'bonus1_7', 'bonus1_8', 'bonus1_9', 'bonus1_10', 'bonus1_11', 'bonus1_12', 'bonus3_1', 'bonus3_2', 'bonus3_3', 'bonus3_4', 'bonus3_5', 'bonus3_6', 'bonus3_7', 'bonus3_8', 'bonus3_9', 'bonus3_10', 'bonus3_11', 'bonus3_12','auditbonuscost_aptMen'});
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout124);
    obj.dataLink58:setFields({'xp1_1', 'xp1_2', 'xp1_3', 'xp1_4', 'xp1_5', 'xp1_6', 'xp1_7', 'xp1_8', 'xp1_9', 'xp1_10', 'xp1_11', 'xp1_12', 'xp3_1', 'xp3_2', 'xp3_3', 'xp3_4', 'xp3_5', 'xp3_6', 'xp3_7', 'xp3_8', 'xp3_9', 'xp3_10', 'xp3_11', 'xp3_12', 'total1_1', 'total1_2', 'total1_3', 'total1_4', 'total1_5', 'total1_6', 'total1_7', 'total1_8', 'total1_9', 'total1_10', 'total1_11', 'total1_12', 'total3_1', 'total3_2', 'total3_3', 'total3_4', 'total3_5', 'total3_6', 'total3_7', 'total3_8', 'total3_9', 'total3_10', 'total3_11', 'total3_12','auditxpcost_aptMen'});
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout124);
    obj.dataLink59:setFields({'historicoValor1_1', 'historicoValor1_2', 'historicoValor1_3', 'historicoValor1_4', 'historicoValor1_5', 'historicoValor1_6', 'historicoValor2_1', 'historicoValor2_2', 'historicoValor2_3', 'historicoValor2_4', 'historicoValor2_5', 'historicoValor2_6', 'historicoValor3_1', 'historicoValor3_2', 'historicoValor3_3', 'historicoValor3_4', 'historicoValor3_5', 'historicoValor3_6'});
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout124);
    obj.dataLink60:setFields({'historicoBonus1_1', 'historicoBonus1_2', 'historicoBonus1_3', 'historicoBonus1_4', 'historicoBonus1_5', 'historicoBonus1_6', 'historicoBonus2_1', 'historicoBonus2_2', 'historicoBonus2_3', 'historicoBonus2_4', 'historicoBonus2_5', 'historicoBonus2_6', 'historicoBonus3_1', 'historicoBonus3_2', 'historicoBonus3_3', 'historicoBonus3_4', 'historicoBonus3_5', 'historicoBonus3_6','auditbonuscost_hist'});
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout124);
    obj.dataLink61:setFields({'historicoXp1_1', 'historicoXp1_2', 'historicoXp1_3', 'historicoXp1_4', 'historicoXp1_5', 'historicoXp1_6', 'historicoXp2_1', 'historicoXp2_2', 'historicoXp2_3', 'historicoXp2_4', 'historicoXp2_5', 'historicoXp2_6', 'historicoXp3_1', 'historicoXp3_2', 'historicoXp3_3', 'historicoXp3_4', 'historicoXp3_5', 'historicoXp3_6', 'historicoTotal1_1', 'historicoTotal1_2', 'historicoTotal1_3', 'historicoTotal1_4', 'historicoTotal1_5', 'historicoTotal1_6', 'historicoTotal2_1', 'historicoTotal2_2', 'historicoTotal2_3', 'historicoTotal2_4', 'historicoTotal2_5', 'historicoTotal2_6', 'historicoTotal3_1', 'historicoTotal3_2', 'historicoTotal3_3', 'historicoTotal3_4', 'historicoTotal3_5', 'historicoTotal3_6','auditxpcost_hist'});
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout124);
    obj.dataLink62:setFields({'inicialconsciencia', 'inicialespirito', 'inicialperseveranca'});
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout124);
    obj.dataLink63:setFields({'bonusconsciencia', 'bonusespirito', 'bonusperseveranca','auditbonuscost_eido'});
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout124);
    obj.dataLink64:setFields({'xpconsciencia', 'xpespirito', 'xpperseveranca', 'testeconsciencia', 'testeespirito', 'testeperseveranca','auditxpcost_eido'});
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout124);
    obj.dataLink65:setFields({'auditbonus_atrFis', 'auditbonus_atrMen', 'auditbonus_aptFis', 'auditbonus_aptMen', 'auditbonus_hist', 'auditbonus_eido', 'auditbonus_out', 'auditbonus_espec', 'auditbonus_extra'});
    obj.dataLink65:setName("dataLink65");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout124);
    obj.dataLink66:setFields({'auditxp_atrFis', 'auditxp_atrMen', 'auditxp_aptFis', 'auditxp_aptMen', 'auditxp_hist', 'auditxp_eido', 'auditxp_out', 'auditxp_espec', 'auditxp_extra'});
    obj.dataLink66:setName("dataLink66");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/output/Ao%20cair%20da%20noite.rpk?raw=true",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/output/Ao%20cair%20da%20noite.rpk?raw=true');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            --showMessage(errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end,"checkForModification");
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeforca) or 0);
            				sheet.rollnome1 = "Força";
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeforca) or 0);
            				sheet.rollnome2 = "Força";
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseforca) or 0)+
            							(tonumber(sheet.inicialforca) or 0)+
            							(tonumber(sheet.bonusforca) or 0)+
            							(tonumber(sheet.xpforca) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "forca"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalforca = mod .. " | " ..(mod / 2);
            					sheet.testeforca = mod / 2;
            				else
            					sheet.totalforca = mod;
            					sheet.testeforca = mod;
            				end;
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeagilidade) or 0);
            				sheet.rollnome1 = "Agilidade";
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeagilidade) or 0);
            				sheet.rollnome2 = "Agilidade";
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseagilidade) or 0)+
            							(tonumber(sheet.inicialagilidade) or 0)+
            							(tonumber(sheet.bonusagilidade) or 0)+
            							(tonumber(sheet.xpagilidade) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "agilidade"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalagilidade = mod .. " | " ..(mod / 2);
            					sheet.testeagilidade = mod / 2;
            				else
            					sheet.totalagilidade = mod;
            					sheet.testeagilidade = mod;
            				end;
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeresiliencia) or 0);
            				sheet.rollnome1 = "Resiliência";
        end, obj);

    obj._e_event8 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeresiliencia) or 0);
            				sheet.rollnome2 = "Resiliência";
        end, obj);

    obj._e_event9 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseresiliencia) or 0)+
            							(tonumber(sheet.inicialresiliencia) or 0)+
            							(tonumber(sheet.bonusresiliencia) or 0)+
            							(tonumber(sheet.xpresiliencia) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "resiliencia"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalresiliencia = mod .. " | " ..(mod / 2);
            					sheet.testeresiliencia = mod / 2;
            				else
            					sheet.totalresiliencia = mod;
            					sheet.testeresiliencia = mod;
            				end;
        end, obj);

    obj._e_event10 = obj.button7:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testecarisma) or 0);
            				sheet.rollnome1 = "Carisma";
        end, obj);

    obj._e_event11 = obj.button8:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testecarisma) or 0);
            				sheet.rollnome2 = "Carisma";
        end, obj);

    obj._e_event12 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.basecarisma) or 0)+
            							(tonumber(sheet.inicialcarisma) or 0)+
            							(tonumber(sheet.bonuscarisma) or 0)+
            							(tonumber(sheet.xpcarisma) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "carisma"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalcarisma = mod .. " | " ..(mod / 2);
            					sheet.testecarisma = mod / 2;
            				else
            					sheet.totalcarisma = mod;
            					sheet.testecarisma = mod;
            				end;
        end, obj);

    obj._e_event13 = obj.button9:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testepercepcao) or 0);
            				sheet.rollnome1 = "Percepção";
        end, obj);

    obj._e_event14 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testepercepcao) or 0);
            				sheet.rollnome2 = "Percepção";
        end, obj);

    obj._e_event15 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.basepercepcao) or 0)+
            							(tonumber(sheet.inicialpercepcao) or 0)+
            							(tonumber(sheet.bonuspercepcao) or 0)+
            							(tonumber(sheet.xppercepcao) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "percepcao"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalpercepcao = mod .. " | " ..(mod / 2);
            					sheet.testepercepcao = mod / 2;
            				else
            					sheet.totalpercepcao = mod;
            					sheet.testepercepcao = mod;
            				end;
        end, obj);

    obj._e_event16 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeperspicacia) or 0);
            				sheet.rollnome1 = "Perspicácia";
        end, obj);

    obj._e_event17 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeperspicacia) or 0);
            				sheet.rollnome2 = "Perspicácia";
        end, obj);

    obj._e_event18 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseperspicacia) or 0)+
            							(tonumber(sheet.inicialperspicacia) or 0)+
            							(tonumber(sheet.bonusperspicacia) or 0)+
            							(tonumber(sheet.xpperspicacia) or 0);
            				if 2 > 1 then
            					local pen = 0;
            					if "perspicacia"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalperspicacia = mod .. " | " ..(mod / 2);
            					sheet.testeperspicacia = mod / 2;
            				else
            					sheet.totalperspicacia = mod;
            					sheet.testeperspicacia = mod;
            				end;
        end, obj);

    obj._e_event19 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeconsciencia) or 0);
            				sheet.rollnome1 = "Consciência";
        end, obj);

    obj._e_event20 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeconsciencia) or 0);
            				sheet.rollnome2 = "Consciência";
        end, obj);

    obj._e_event21 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseconsciencia) or 0)+
            							(tonumber(sheet.inicialconsciencia) or 0)+
            							(tonumber(sheet.bonusconsciencia) or 0)+
            							(tonumber(sheet.xpconsciencia) or 0);
            				if 1 > 1 then
            					local pen = 0;
            					if "consciencia"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalconsciencia = mod .. " | " ..(mod / 1);
            					sheet.testeconsciencia = mod / 1;
            				else
            					sheet.totalconsciencia = mod;
            					sheet.testeconsciencia = mod;
            				end;
        end, obj);

    obj._e_event22 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeespirito) or 0);
            				sheet.rollnome1 = "Espírito";
        end, obj);

    obj._e_event23 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeespirito) or 0);
            				sheet.rollnome2 = "Espírito";
        end, obj);

    obj._e_event24 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseespirito) or 0)+
            							(tonumber(sheet.inicialespirito) or 0)+
            							(tonumber(sheet.bonusespirito) or 0)+
            							(tonumber(sheet.xpespirito) or 0);
            				if 1 > 1 then
            					local pen = 0;
            					if "espirito"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalespirito = mod .. " | " ..(mod / 1);
            					sheet.testeespirito = mod / 1;
            				else
            					sheet.totalespirito = mod;
            					sheet.testeespirito = mod;
            				end;
        end, obj);

    obj._e_event25 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.testeperseveranca) or 0);
            				sheet.rollnome1 = "Perseverança";
        end, obj);

    obj._e_event26 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.testeperseveranca) or 0);
            				sheet.rollnome2 = "Perseverança";
        end, obj);

    obj._e_event27 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local mod = (tonumber(sheet.baseperseveranca) or 0)+
            							(tonumber(sheet.inicialperseveranca) or 0)+
            							(tonumber(sheet.bonusperseveranca) or 0)+
            							(tonumber(sheet.xpperseveranca) or 0);
            				if 1 > 1 then
            					local pen = 0;
            					if "perseveranca"=="agilidade" then
            						pen = (tonumber(sheet.penalidadeArmadura) or 0) +
            							(tonumber(sheet.penalidadeEscudo) or 0);
            						mod = mod - pen;
            					end;
            					sheet.totalperseveranca = mod .. " | " ..(mod / 1);
            					sheet.testeperseveranca = mod / 1;
            				else
            					sheet.totalperseveranca = mod;
            					sheet.testeperseveranca = mod;
            				end;
        end, obj);

    obj._e_event28 = obj.edit39:addEventListener("onUserChange",
        function (_)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event29 = obj.edit40:addEventListener("onUserChange",
        function (_)
            if sheet.gladiusMin~=nil and sheet.gladiusMax~=nil then
            							sheet.gladius = sheet.gladiusMin/sheet.gladiusMax;
            						end;
        end, obj);

    obj._e_event30 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_1;
        end, obj);

    obj._e_event31 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_1;
        end, obj);

    obj._e_event32 = obj.edit42:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event33 = obj.edit43:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event34 = obj.edit44:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_1) or 0)+
            							(tonumber(sheet.historicoBonus1_1) or 0)+
            							(tonumber(sheet.historicoXp1_1) or 0);
            				sheet.historicoTotal1_1 = mod;
        end, obj);

    obj._e_event35 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_2;
        end, obj);

    obj._e_event36 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_2;
        end, obj);

    obj._e_event37 = obj.edit46:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event38 = obj.edit47:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event39 = obj.edit48:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_2) or 0)+
            							(tonumber(sheet.historicoBonus1_2) or 0)+
            							(tonumber(sheet.historicoXp1_2) or 0);
            				sheet.historicoTotal1_2 = mod;
        end, obj);

    obj._e_event40 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_3;
        end, obj);

    obj._e_event41 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_3;
        end, obj);

    obj._e_event42 = obj.edit50:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event43 = obj.edit51:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event44 = obj.edit52:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_3) or 0)+
            							(tonumber(sheet.historicoBonus1_3) or 0)+
            							(tonumber(sheet.historicoXp1_3) or 0);
            				sheet.historicoTotal1_3 = mod;
        end, obj);

    obj._e_event45 = obj.button25:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_4;
        end, obj);

    obj._e_event46 = obj.button26:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_4;
        end, obj);

    obj._e_event47 = obj.edit54:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event48 = obj.edit55:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event49 = obj.edit56:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_4) or 0)+
            							(tonumber(sheet.historicoBonus1_4) or 0)+
            							(tonumber(sheet.historicoXp1_4) or 0);
            				sheet.historicoTotal1_4 = mod;
        end, obj);

    obj._e_event50 = obj.button27:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_5;
        end, obj);

    obj._e_event51 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_5;
        end, obj);

    obj._e_event52 = obj.edit58:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event53 = obj.edit59:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event54 = obj.edit60:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_5) or 0)+
            							(tonumber(sheet.historicoBonus1_5) or 0)+
            							(tonumber(sheet.historicoXp1_5) or 0);
            				sheet.historicoTotal1_5 = mod;
        end, obj);

    obj._e_event55 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal1_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome1_6;
        end, obj);

    obj._e_event56 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal1_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome1_6;
        end, obj);

    obj._e_event57 = obj.edit62:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event58 = obj.edit63:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event59 = obj.edit64:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor1_6) or 0)+
            							(tonumber(sheet.historicoBonus1_6) or 0)+
            							(tonumber(sheet.historicoXp1_6) or 0);
            				sheet.historicoTotal1_6 = mod;
        end, obj);

    obj._e_event60 = obj.button31:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_1;
        end, obj);

    obj._e_event61 = obj.button32:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_1;
        end, obj);

    obj._e_event62 = obj.edit66:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event63 = obj.edit67:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event64 = obj.edit68:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_1) or 0)+
            							(tonumber(sheet.historicoBonus2_1) or 0)+
            							(tonumber(sheet.historicoXp2_1) or 0);
            				sheet.historicoTotal2_1 = mod;
        end, obj);

    obj._e_event65 = obj.button33:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_2;
        end, obj);

    obj._e_event66 = obj.button34:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_2;
        end, obj);

    obj._e_event67 = obj.edit70:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event68 = obj.edit71:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event69 = obj.edit72:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_2) or 0)+
            							(tonumber(sheet.historicoBonus2_2) or 0)+
            							(tonumber(sheet.historicoXp2_2) or 0);
            				sheet.historicoTotal2_2 = mod;
        end, obj);

    obj._e_event70 = obj.button35:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_3;
        end, obj);

    obj._e_event71 = obj.button36:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_3;
        end, obj);

    obj._e_event72 = obj.edit74:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event73 = obj.edit75:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event74 = obj.edit76:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_3) or 0)+
            							(tonumber(sheet.historicoBonus2_3) or 0)+
            							(tonumber(sheet.historicoXp2_3) or 0);
            				sheet.historicoTotal2_3 = mod;
        end, obj);

    obj._e_event75 = obj.button37:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_4;
        end, obj);

    obj._e_event76 = obj.button38:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_4;
        end, obj);

    obj._e_event77 = obj.edit78:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event78 = obj.edit79:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event79 = obj.edit80:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_4) or 0)+
            							(tonumber(sheet.historicoBonus2_4) or 0)+
            							(tonumber(sheet.historicoXp2_4) or 0);
            				sheet.historicoTotal2_4 = mod;
        end, obj);

    obj._e_event80 = obj.button39:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_5;
        end, obj);

    obj._e_event81 = obj.button40:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_5;
        end, obj);

    obj._e_event82 = obj.edit82:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event83 = obj.edit83:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event84 = obj.edit84:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_5) or 0)+
            							(tonumber(sheet.historicoBonus2_5) or 0)+
            							(tonumber(sheet.historicoXp2_5) or 0);
            				sheet.historicoTotal2_5 = mod;
        end, obj);

    obj._e_event85 = obj.button41:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal2_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome2_6;
        end, obj);

    obj._e_event86 = obj.button42:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal2_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome2_6;
        end, obj);

    obj._e_event87 = obj.edit86:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event88 = obj.edit87:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event89 = obj.edit88:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor2_6) or 0)+
            							(tonumber(sheet.historicoBonus2_6) or 0)+
            							(tonumber(sheet.historicoXp2_6) or 0);
            				sheet.historicoTotal2_6 = mod;
        end, obj);

    obj._e_event90 = obj.button43:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_1) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_1;
        end, obj);

    obj._e_event91 = obj.button44:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_1) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_1;
        end, obj);

    obj._e_event92 = obj.edit90:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event93 = obj.edit91:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event94 = obj.edit92:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_1) or 0)+
            							(tonumber(sheet.historicoBonus3_1) or 0)+
            							(tonumber(sheet.historicoXp3_1) or 0);
            				sheet.historicoTotal3_1 = mod;
        end, obj);

    obj._e_event95 = obj.button45:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_2) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_2;
        end, obj);

    obj._e_event96 = obj.button46:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_2) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_2;
        end, obj);

    obj._e_event97 = obj.edit94:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event98 = obj.edit95:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event99 = obj.edit96:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_2) or 0)+
            							(tonumber(sheet.historicoBonus3_2) or 0)+
            							(tonumber(sheet.historicoXp3_2) or 0);
            				sheet.historicoTotal3_2 = mod;
        end, obj);

    obj._e_event100 = obj.button47:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_3) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_3;
        end, obj);

    obj._e_event101 = obj.button48:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_3) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_3;
        end, obj);

    obj._e_event102 = obj.edit98:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event103 = obj.edit99:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event104 = obj.edit100:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_3) or 0)+
            							(tonumber(sheet.historicoBonus3_3) or 0)+
            							(tonumber(sheet.historicoXp3_3) or 0);
            				sheet.historicoTotal3_3 = mod;
        end, obj);

    obj._e_event105 = obj.button49:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_4) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_4;
        end, obj);

    obj._e_event106 = obj.button50:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_4) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_4;
        end, obj);

    obj._e_event107 = obj.edit102:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event108 = obj.edit103:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event109 = obj.edit104:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_4) or 0)+
            							(tonumber(sheet.historicoBonus3_4) or 0)+
            							(tonumber(sheet.historicoXp3_4) or 0);
            				sheet.historicoTotal3_4 = mod;
        end, obj);

    obj._e_event110 = obj.button51:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_5) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_5;
        end, obj);

    obj._e_event111 = obj.button52:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_5) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_5;
        end, obj);

    obj._e_event112 = obj.edit106:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event113 = obj.edit107:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event114 = obj.edit108:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_5) or 0)+
            							(tonumber(sheet.historicoBonus3_5) or 0)+
            							(tonumber(sheet.historicoXp3_5) or 0);
            				sheet.historicoTotal3_5 = mod;
        end, obj);

    obj._e_event115 = obj.button53:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.historicoTotal3_6) or 0);
            				sheet.rollnome1 = sheet.historicoNome3_6;
        end, obj);

    obj._e_event116 = obj.button54:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.historicoTotal3_6) or 0);
            				sheet.rollnome2 = sheet.historicoNome3_6;
        end, obj);

    obj._e_event117 = obj.edit110:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event118 = obj.edit111:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event119 = obj.edit112:addEventListener("onUserChange",
        function (_)
            local mod = (tonumber(sheet.historicoValor3_6) or 0)+
            							(tonumber(sheet.historicoBonus3_6) or 0)+
            							(tonumber(sheet.historicoXp3_6) or 0);
            				sheet.historicoTotal3_6 = mod;
        end, obj);

    obj._e_event120 = obj.button55:addEventListener("onClick",
        function (_)
            local rcl = self.rclListaOutros:append();
            					if rcl~=nil then 
            						rcl.multXp = sheet.auditxpcost_out;
            						rcl.multApr = sheet.auditbonuscost_out;
            					end;
        end, obj);

    obj._e_event121 = obj.rclListaOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event122 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absRes = math.floor(tonumber(sheet.testeresiliencia) or 0);
            					end;
        end, obj);

    obj._e_event123 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.absorcao = (tonumber(sheet.absRes) or 0) + (tonumber(sheet.absOutros) or 0) + (tonumber(sheet.indiceArmadura) or 0);
            					end;
        end, obj);

    obj._e_event124 = obj.button56:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            					rolagem = rrpg.interpretarRolagem("1d10 + " .. (sheet.iniciativa or 0));
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (sheet.nome or 0));
        end, obj);

    obj._e_event125 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.iniciativa = ((tonumber(sheet.testeagilidade) or 0) + (tonumber(sheet.testeperspicacia) or 0)) * 2 + (tonumber(sheet.iniciativaBonus) or 0);
            						sheet.velocidade = ((tonumber(sheet.testeagilidade) or 0) + (tonumber(sheet.testeforca) or 0) + 2) * 2 + (tonumber(sheet.velocidadeBonus) or 0);
            						local mod = math.floor(((tonumber(sheet.velocidade) or 0)/3) * 100);
            						mod = mod / 100;
            						sheet.ms = mod .. "m/s";
            						sheet.kmh = ((tonumber(sheet.velocidade) or 0)*1.2) .. "Km/h";
            					end;
        end, obj);

    obj._e_event126 = obj.button57:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            					sheet.field2 = nil;
            					sheet.num2 = nil;
            					sheet.rollnome2 = nil;
        end, obj);

    obj._e_event127 = obj.button58:addEventListener("onClick",
        function (_)
            rolar();
        end, obj);

    obj._e_event128 = obj.button59:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_1) or 0);
            				sheet.rollnome1 = sheet.nome0_1;
        end, obj);

    obj._e_event129 = obj.button60:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_1) or 0);
            				sheet.rollnome2 = sheet.nome0_1;
        end, obj);

    obj._e_event130 = obj.edit125:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_1) or 0)+
            											(tonumber(sheet.bonus0_1) or 0)+
            											(tonumber(sheet.xp0_1) or 0);
            					sheet.total0_1 = mod / 2;
            					sheet.total20_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event131 = obj.edit126:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_1) or 0)+
            											(tonumber(sheet.bonus0_1) or 0)+
            											(tonumber(sheet.xp0_1) or 0);
            					sheet.total0_1 = mod / 2;
            					sheet.total20_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event132 = obj.edit127:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_1) or 0)+
            											(tonumber(sheet.bonus0_1) or 0)+
            											(tonumber(sheet.xp0_1) or 0);
            					sheet.total0_1 = mod / 2;
            					sheet.total20_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event133 = obj.button61:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_2) or 0);
            				sheet.rollnome1 = sheet.nome0_2;
        end, obj);

    obj._e_event134 = obj.button62:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_2) or 0);
            				sheet.rollnome2 = sheet.nome0_2;
        end, obj);

    obj._e_event135 = obj.edit130:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_2) or 0)+
            											(tonumber(sheet.bonus0_2) or 0)+
            											(tonumber(sheet.xp0_2) or 0);
            					sheet.total0_2 = mod / 2;
            					sheet.total20_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event136 = obj.edit131:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_2) or 0)+
            											(tonumber(sheet.bonus0_2) or 0)+
            											(tonumber(sheet.xp0_2) or 0);
            					sheet.total0_2 = mod / 2;
            					sheet.total20_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event137 = obj.edit132:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_2) or 0)+
            											(tonumber(sheet.bonus0_2) or 0)+
            											(tonumber(sheet.xp0_2) or 0);
            					sheet.total0_2 = mod / 2;
            					sheet.total20_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event138 = obj.button63:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_3) or 0);
            				sheet.rollnome1 = sheet.nome0_3;
        end, obj);

    obj._e_event139 = obj.button64:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_3) or 0);
            				sheet.rollnome2 = sheet.nome0_3;
        end, obj);

    obj._e_event140 = obj.edit135:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_3) or 0)+
            											(tonumber(sheet.bonus0_3) or 0)+
            											(tonumber(sheet.xp0_3) or 0);
            					sheet.total0_3 = mod / 2;
            					sheet.total20_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event141 = obj.edit136:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_3) or 0)+
            											(tonumber(sheet.bonus0_3) or 0)+
            											(tonumber(sheet.xp0_3) or 0);
            					sheet.total0_3 = mod / 2;
            					sheet.total20_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event142 = obj.edit137:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_3) or 0)+
            											(tonumber(sheet.bonus0_3) or 0)+
            											(tonumber(sheet.xp0_3) or 0);
            					sheet.total0_3 = mod / 2;
            					sheet.total20_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event143 = obj.button65:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_4) or 0);
            				sheet.rollnome1 = sheet.nome0_4;
        end, obj);

    obj._e_event144 = obj.button66:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_4) or 0);
            				sheet.rollnome2 = sheet.nome0_4;
        end, obj);

    obj._e_event145 = obj.edit140:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_4) or 0)+
            											(tonumber(sheet.bonus0_4) or 0)+
            											(tonumber(sheet.xp0_4) or 0);
            					sheet.total0_4 = mod / 2;
            					sheet.total20_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event146 = obj.edit141:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_4) or 0)+
            											(tonumber(sheet.bonus0_4) or 0)+
            											(tonumber(sheet.xp0_4) or 0);
            					sheet.total0_4 = mod / 2;
            					sheet.total20_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event147 = obj.edit142:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_4) or 0)+
            											(tonumber(sheet.bonus0_4) or 0)+
            											(tonumber(sheet.xp0_4) or 0);
            					sheet.total0_4 = mod / 2;
            					sheet.total20_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event148 = obj.button67:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_5) or 0);
            				sheet.rollnome1 = sheet.nome0_5;
        end, obj);

    obj._e_event149 = obj.button68:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_5) or 0);
            				sheet.rollnome2 = sheet.nome0_5;
        end, obj);

    obj._e_event150 = obj.edit145:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_5) or 0)+
            											(tonumber(sheet.bonus0_5) or 0)+
            											(tonumber(sheet.xp0_5) or 0);
            					sheet.total0_5 = mod / 2;
            					sheet.total20_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event151 = obj.edit146:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_5) or 0)+
            											(tonumber(sheet.bonus0_5) or 0)+
            											(tonumber(sheet.xp0_5) or 0);
            					sheet.total0_5 = mod / 2;
            					sheet.total20_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event152 = obj.edit147:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_5) or 0)+
            											(tonumber(sheet.bonus0_5) or 0)+
            											(tonumber(sheet.xp0_5) or 0);
            					sheet.total0_5 = mod / 2;
            					sheet.total20_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event153 = obj.button69:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_6) or 0);
            				sheet.rollnome1 = sheet.nome0_6;
        end, obj);

    obj._e_event154 = obj.button70:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_6) or 0);
            				sheet.rollnome2 = sheet.nome0_6;
        end, obj);

    obj._e_event155 = obj.edit150:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_6) or 0)+
            											(tonumber(sheet.bonus0_6) or 0)+
            											(tonumber(sheet.xp0_6) or 0);
            					sheet.total0_6 = mod / 2;
            					sheet.total20_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event156 = obj.edit151:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_6) or 0)+
            											(tonumber(sheet.bonus0_6) or 0)+
            											(tonumber(sheet.xp0_6) or 0);
            					sheet.total0_6 = mod / 2;
            					sheet.total20_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event157 = obj.edit152:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_6) or 0)+
            											(tonumber(sheet.bonus0_6) or 0)+
            											(tonumber(sheet.xp0_6) or 0);
            					sheet.total0_6 = mod / 2;
            					sheet.total20_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event158 = obj.button71:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_7) or 0);
            				sheet.rollnome1 = sheet.nome0_7;
        end, obj);

    obj._e_event159 = obj.button72:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_7) or 0);
            				sheet.rollnome2 = sheet.nome0_7;
        end, obj);

    obj._e_event160 = obj.edit155:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_7) or 0)+
            											(tonumber(sheet.bonus0_7) or 0)+
            											(tonumber(sheet.xp0_7) or 0);
            					sheet.total0_7 = mod / 2;
            					sheet.total20_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event161 = obj.edit156:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_7) or 0)+
            											(tonumber(sheet.bonus0_7) or 0)+
            											(tonumber(sheet.xp0_7) or 0);
            					sheet.total0_7 = mod / 2;
            					sheet.total20_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event162 = obj.edit157:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_7) or 0)+
            											(tonumber(sheet.bonus0_7) or 0)+
            											(tonumber(sheet.xp0_7) or 0);
            					sheet.total0_7 = mod / 2;
            					sheet.total20_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event163 = obj.button73:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_8) or 0);
            				sheet.rollnome1 = sheet.nome0_8;
        end, obj);

    obj._e_event164 = obj.button74:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_8) or 0);
            				sheet.rollnome2 = sheet.nome0_8;
        end, obj);

    obj._e_event165 = obj.edit160:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_8) or 0)+
            											(tonumber(sheet.bonus0_8) or 0)+
            											(tonumber(sheet.xp0_8) or 0);
            					sheet.total0_8 = mod / 2;
            					sheet.total20_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event166 = obj.edit161:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_8) or 0)+
            											(tonumber(sheet.bonus0_8) or 0)+
            											(tonumber(sheet.xp0_8) or 0);
            					sheet.total0_8 = mod / 2;
            					sheet.total20_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event167 = obj.edit162:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_8) or 0)+
            											(tonumber(sheet.bonus0_8) or 0)+
            											(tonumber(sheet.xp0_8) or 0);
            					sheet.total0_8 = mod / 2;
            					sheet.total20_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event168 = obj.button75:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_9) or 0);
            				sheet.rollnome1 = sheet.nome0_9;
        end, obj);

    obj._e_event169 = obj.button76:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_9) or 0);
            				sheet.rollnome2 = sheet.nome0_9;
        end, obj);

    obj._e_event170 = obj.edit165:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_9) or 0)+
            											(tonumber(sheet.bonus0_9) or 0)+
            											(tonumber(sheet.xp0_9) or 0);
            					sheet.total0_9 = mod / 2;
            					sheet.total20_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event171 = obj.edit166:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_9) or 0)+
            											(tonumber(sheet.bonus0_9) or 0)+
            											(tonumber(sheet.xp0_9) or 0);
            					sheet.total0_9 = mod / 2;
            					sheet.total20_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event172 = obj.edit167:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_9) or 0)+
            											(tonumber(sheet.bonus0_9) or 0)+
            											(tonumber(sheet.xp0_9) or 0);
            					sheet.total0_9 = mod / 2;
            					sheet.total20_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event173 = obj.button77:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_10) or 0);
            				sheet.rollnome1 = sheet.nome0_10;
        end, obj);

    obj._e_event174 = obj.button78:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_10) or 0);
            				sheet.rollnome2 = sheet.nome0_10;
        end, obj);

    obj._e_event175 = obj.edit170:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_10) or 0)+
            											(tonumber(sheet.bonus0_10) or 0)+
            											(tonumber(sheet.xp0_10) or 0);
            					sheet.total0_10 = mod / 2;
            					sheet.total20_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event176 = obj.edit171:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_10) or 0)+
            											(tonumber(sheet.bonus0_10) or 0)+
            											(tonumber(sheet.xp0_10) or 0);
            					sheet.total0_10 = mod / 2;
            					sheet.total20_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event177 = obj.edit172:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_10) or 0)+
            											(tonumber(sheet.bonus0_10) or 0)+
            											(tonumber(sheet.xp0_10) or 0);
            					sheet.total0_10 = mod / 2;
            					sheet.total20_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event178 = obj.button79:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_11) or 0);
            				sheet.rollnome1 = sheet.nome0_11;
        end, obj);

    obj._e_event179 = obj.button80:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_11) or 0);
            				sheet.rollnome2 = sheet.nome0_11;
        end, obj);

    obj._e_event180 = obj.edit175:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_11) or 0)+
            											(tonumber(sheet.bonus0_11) or 0)+
            											(tonumber(sheet.xp0_11) or 0);
            					sheet.total0_11 = mod / 2;
            					sheet.total20_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event181 = obj.edit176:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_11) or 0)+
            											(tonumber(sheet.bonus0_11) or 0)+
            											(tonumber(sheet.xp0_11) or 0);
            					sheet.total0_11 = mod / 2;
            					sheet.total20_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event182 = obj.edit177:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_11) or 0)+
            											(tonumber(sheet.bonus0_11) or 0)+
            											(tonumber(sheet.xp0_11) or 0);
            					sheet.total0_11 = mod / 2;
            					sheet.total20_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event183 = obj.button81:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total0_12) or 0);
            				sheet.rollnome1 = sheet.nome0_12;
        end, obj);

    obj._e_event184 = obj.button82:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total0_12) or 0);
            				sheet.rollnome2 = sheet.nome0_12;
        end, obj);

    obj._e_event185 = obj.edit180:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_12) or 0)+
            											(tonumber(sheet.bonus0_12) or 0)+
            											(tonumber(sheet.xp0_12) or 0);
            					sheet.total0_12 = mod / 2;
            					sheet.total20_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event186 = obj.edit181:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_12) or 0)+
            											(tonumber(sheet.bonus0_12) or 0)+
            											(tonumber(sheet.xp0_12) or 0);
            					sheet.total0_12 = mod / 2;
            					sheet.total20_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event187 = obj.edit182:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base0_12) or 0)+
            											(tonumber(sheet.bonus0_12) or 0)+
            											(tonumber(sheet.xp0_12) or 0);
            					sheet.total0_12 = mod / 2;
            					sheet.total20_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event188 = obj.button83:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_1) or 0);
            				sheet.rollnome1 = sheet.nome2_1;
        end, obj);

    obj._e_event189 = obj.button84:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_1) or 0);
            				sheet.rollnome2 = sheet.nome2_1;
        end, obj);

    obj._e_event190 = obj.edit185:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_1) or 0)+
            											(tonumber(sheet.bonus2_1) or 0)+
            											(tonumber(sheet.xp2_1) or 0);
            					sheet.total2_1 = mod / 2;
            					sheet.total22_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event191 = obj.edit186:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_1) or 0)+
            											(tonumber(sheet.bonus2_1) or 0)+
            											(tonumber(sheet.xp2_1) or 0);
            					sheet.total2_1 = mod / 2;
            					sheet.total22_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event192 = obj.edit187:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_1) or 0)+
            											(tonumber(sheet.bonus2_1) or 0)+
            											(tonumber(sheet.xp2_1) or 0);
            					sheet.total2_1 = mod / 2;
            					sheet.total22_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event193 = obj.button85:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_2) or 0);
            				sheet.rollnome1 = sheet.nome2_2;
        end, obj);

    obj._e_event194 = obj.button86:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_2) or 0);
            				sheet.rollnome2 = sheet.nome2_2;
        end, obj);

    obj._e_event195 = obj.edit190:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_2) or 0)+
            											(tonumber(sheet.bonus2_2) or 0)+
            											(tonumber(sheet.xp2_2) or 0);
            					sheet.total2_2 = mod / 2;
            					sheet.total22_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event196 = obj.edit191:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_2) or 0)+
            											(tonumber(sheet.bonus2_2) or 0)+
            											(tonumber(sheet.xp2_2) or 0);
            					sheet.total2_2 = mod / 2;
            					sheet.total22_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event197 = obj.edit192:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_2) or 0)+
            											(tonumber(sheet.bonus2_2) or 0)+
            											(tonumber(sheet.xp2_2) or 0);
            					sheet.total2_2 = mod / 2;
            					sheet.total22_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event198 = obj.button87:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_3) or 0);
            				sheet.rollnome1 = sheet.nome2_3;
        end, obj);

    obj._e_event199 = obj.button88:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_3) or 0);
            				sheet.rollnome2 = sheet.nome2_3;
        end, obj);

    obj._e_event200 = obj.edit195:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_3) or 0)+
            											(tonumber(sheet.bonus2_3) or 0)+
            											(tonumber(sheet.xp2_3) or 0);
            					sheet.total2_3 = mod / 2;
            					sheet.total22_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event201 = obj.edit196:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_3) or 0)+
            											(tonumber(sheet.bonus2_3) or 0)+
            											(tonumber(sheet.xp2_3) or 0);
            					sheet.total2_3 = mod / 2;
            					sheet.total22_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event202 = obj.edit197:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_3) or 0)+
            											(tonumber(sheet.bonus2_3) or 0)+
            											(tonumber(sheet.xp2_3) or 0);
            					sheet.total2_3 = mod / 2;
            					sheet.total22_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event203 = obj.button89:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_4) or 0);
            				sheet.rollnome1 = sheet.nome2_4;
        end, obj);

    obj._e_event204 = obj.button90:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_4) or 0);
            				sheet.rollnome2 = sheet.nome2_4;
        end, obj);

    obj._e_event205 = obj.edit200:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_4) or 0)+
            											(tonumber(sheet.bonus2_4) or 0)+
            											(tonumber(sheet.xp2_4) or 0);
            					sheet.total2_4 = mod / 2;
            					sheet.total22_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event206 = obj.edit201:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_4) or 0)+
            											(tonumber(sheet.bonus2_4) or 0)+
            											(tonumber(sheet.xp2_4) or 0);
            					sheet.total2_4 = mod / 2;
            					sheet.total22_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event207 = obj.edit202:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_4) or 0)+
            											(tonumber(sheet.bonus2_4) or 0)+
            											(tonumber(sheet.xp2_4) or 0);
            					sheet.total2_4 = mod / 2;
            					sheet.total22_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event208 = obj.button91:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_5) or 0);
            				sheet.rollnome1 = sheet.nome2_5;
        end, obj);

    obj._e_event209 = obj.button92:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_5) or 0);
            				sheet.rollnome2 = sheet.nome2_5;
        end, obj);

    obj._e_event210 = obj.edit205:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_5) or 0)+
            											(tonumber(sheet.bonus2_5) or 0)+
            											(tonumber(sheet.xp2_5) or 0);
            					sheet.total2_5 = mod / 2;
            					sheet.total22_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event211 = obj.edit206:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_5) or 0)+
            											(tonumber(sheet.bonus2_5) or 0)+
            											(tonumber(sheet.xp2_5) or 0);
            					sheet.total2_5 = mod / 2;
            					sheet.total22_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event212 = obj.edit207:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_5) or 0)+
            											(tonumber(sheet.bonus2_5) or 0)+
            											(tonumber(sheet.xp2_5) or 0);
            					sheet.total2_5 = mod / 2;
            					sheet.total22_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event213 = obj.button93:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_6) or 0);
            				sheet.rollnome1 = sheet.nome2_6;
        end, obj);

    obj._e_event214 = obj.button94:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_6) or 0);
            				sheet.rollnome2 = sheet.nome2_6;
        end, obj);

    obj._e_event215 = obj.edit210:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_6) or 0)+
            											(tonumber(sheet.bonus2_6) or 0)+
            											(tonumber(sheet.xp2_6) or 0);
            					sheet.total2_6 = mod / 2;
            					sheet.total22_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event216 = obj.edit211:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_6) or 0)+
            											(tonumber(sheet.bonus2_6) or 0)+
            											(tonumber(sheet.xp2_6) or 0);
            					sheet.total2_6 = mod / 2;
            					sheet.total22_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event217 = obj.edit212:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_6) or 0)+
            											(tonumber(sheet.bonus2_6) or 0)+
            											(tonumber(sheet.xp2_6) or 0);
            					sheet.total2_6 = mod / 2;
            					sheet.total22_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event218 = obj.button95:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_7) or 0);
            				sheet.rollnome1 = sheet.nome2_7;
        end, obj);

    obj._e_event219 = obj.button96:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_7) or 0);
            				sheet.rollnome2 = sheet.nome2_7;
        end, obj);

    obj._e_event220 = obj.edit215:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_7) or 0)+
            											(tonumber(sheet.bonus2_7) or 0)+
            											(tonumber(sheet.xp2_7) or 0);
            					sheet.total2_7 = mod / 2;
            					sheet.total22_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event221 = obj.edit216:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_7) or 0)+
            											(tonumber(sheet.bonus2_7) or 0)+
            											(tonumber(sheet.xp2_7) or 0);
            					sheet.total2_7 = mod / 2;
            					sheet.total22_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event222 = obj.edit217:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_7) or 0)+
            											(tonumber(sheet.bonus2_7) or 0)+
            											(tonumber(sheet.xp2_7) or 0);
            					sheet.total2_7 = mod / 2;
            					sheet.total22_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event223 = obj.button97:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_8) or 0);
            				sheet.rollnome1 = sheet.nome2_8;
        end, obj);

    obj._e_event224 = obj.button98:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_8) or 0);
            				sheet.rollnome2 = sheet.nome2_8;
        end, obj);

    obj._e_event225 = obj.edit220:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_8) or 0)+
            											(tonumber(sheet.bonus2_8) or 0)+
            											(tonumber(sheet.xp2_8) or 0);
            					sheet.total2_8 = mod / 2;
            					sheet.total22_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event226 = obj.edit221:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_8) or 0)+
            											(tonumber(sheet.bonus2_8) or 0)+
            											(tonumber(sheet.xp2_8) or 0);
            					sheet.total2_8 = mod / 2;
            					sheet.total22_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event227 = obj.edit222:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_8) or 0)+
            											(tonumber(sheet.bonus2_8) or 0)+
            											(tonumber(sheet.xp2_8) or 0);
            					sheet.total2_8 = mod / 2;
            					sheet.total22_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event228 = obj.button99:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_9) or 0);
            				sheet.rollnome1 = sheet.nome2_9;
        end, obj);

    obj._e_event229 = obj.button100:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_9) or 0);
            				sheet.rollnome2 = sheet.nome2_9;
        end, obj);

    obj._e_event230 = obj.edit225:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_9) or 0)+
            											(tonumber(sheet.bonus2_9) or 0)+
            											(tonumber(sheet.xp2_9) or 0);
            					sheet.total2_9 = mod / 2;
            					sheet.total22_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event231 = obj.edit226:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_9) or 0)+
            											(tonumber(sheet.bonus2_9) or 0)+
            											(tonumber(sheet.xp2_9) or 0);
            					sheet.total2_9 = mod / 2;
            					sheet.total22_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event232 = obj.edit227:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_9) or 0)+
            											(tonumber(sheet.bonus2_9) or 0)+
            											(tonumber(sheet.xp2_9) or 0);
            					sheet.total2_9 = mod / 2;
            					sheet.total22_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event233 = obj.button101:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_10) or 0);
            				sheet.rollnome1 = sheet.nome2_10;
        end, obj);

    obj._e_event234 = obj.button102:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_10) or 0);
            				sheet.rollnome2 = sheet.nome2_10;
        end, obj);

    obj._e_event235 = obj.edit230:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_10) or 0)+
            											(tonumber(sheet.bonus2_10) or 0)+
            											(tonumber(sheet.xp2_10) or 0);
            					sheet.total2_10 = mod / 2;
            					sheet.total22_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event236 = obj.edit231:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_10) or 0)+
            											(tonumber(sheet.bonus2_10) or 0)+
            											(tonumber(sheet.xp2_10) or 0);
            					sheet.total2_10 = mod / 2;
            					sheet.total22_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event237 = obj.edit232:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_10) or 0)+
            											(tonumber(sheet.bonus2_10) or 0)+
            											(tonumber(sheet.xp2_10) or 0);
            					sheet.total2_10 = mod / 2;
            					sheet.total22_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event238 = obj.button103:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_11) or 0);
            				sheet.rollnome1 = sheet.nome2_11;
        end, obj);

    obj._e_event239 = obj.button104:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_11) or 0);
            				sheet.rollnome2 = sheet.nome2_11;
        end, obj);

    obj._e_event240 = obj.edit235:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_11) or 0)+
            											(tonumber(sheet.bonus2_11) or 0)+
            											(tonumber(sheet.xp2_11) or 0);
            					sheet.total2_11 = mod / 2;
            					sheet.total22_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event241 = obj.edit236:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_11) or 0)+
            											(tonumber(sheet.bonus2_11) or 0)+
            											(tonumber(sheet.xp2_11) or 0);
            					sheet.total2_11 = mod / 2;
            					sheet.total22_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event242 = obj.edit237:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_11) or 0)+
            											(tonumber(sheet.bonus2_11) or 0)+
            											(tonumber(sheet.xp2_11) or 0);
            					sheet.total2_11 = mod / 2;
            					sheet.total22_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event243 = obj.button105:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total2_12) or 0);
            				sheet.rollnome1 = sheet.nome2_12;
        end, obj);

    obj._e_event244 = obj.button106:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total2_12) or 0);
            				sheet.rollnome2 = sheet.nome2_12;
        end, obj);

    obj._e_event245 = obj.edit240:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_12) or 0)+
            											(tonumber(sheet.bonus2_12) or 0)+
            											(tonumber(sheet.xp2_12) or 0);
            					sheet.total2_12 = mod / 2;
            					sheet.total22_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event246 = obj.edit241:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_12) or 0)+
            											(tonumber(sheet.bonus2_12) or 0)+
            											(tonumber(sheet.xp2_12) or 0);
            					sheet.total2_12 = mod / 2;
            					sheet.total22_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event247 = obj.edit242:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base2_12) or 0)+
            											(tonumber(sheet.bonus2_12) or 0)+
            											(tonumber(sheet.xp2_12) or 0);
            					sheet.total2_12 = mod / 2;
            					sheet.total22_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event248 = obj.button107:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_1) or 0);
            				sheet.rollnome1 = sheet.nome1_1;
        end, obj);

    obj._e_event249 = obj.button108:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_1) or 0);
            				sheet.rollnome2 = sheet.nome1_1;
        end, obj);

    obj._e_event250 = obj.edit245:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_1) or 0)+
            											(tonumber(sheet.bonus1_1) or 0)+
            											(tonumber(sheet.xp1_1) or 0);
            					sheet.total1_1 = mod / 2;
            					sheet.total21_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event251 = obj.edit246:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_1) or 0)+
            											(tonumber(sheet.bonus1_1) or 0)+
            											(tonumber(sheet.xp1_1) or 0);
            					sheet.total1_1 = mod / 2;
            					sheet.total21_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event252 = obj.edit247:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_1) or 0)+
            											(tonumber(sheet.bonus1_1) or 0)+
            											(tonumber(sheet.xp1_1) or 0);
            					sheet.total1_1 = mod / 2;
            					sheet.total21_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event253 = obj.button109:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_2) or 0);
            				sheet.rollnome1 = sheet.nome1_2;
        end, obj);

    obj._e_event254 = obj.button110:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_2) or 0);
            				sheet.rollnome2 = sheet.nome1_2;
        end, obj);

    obj._e_event255 = obj.edit250:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_2) or 0)+
            											(tonumber(sheet.bonus1_2) or 0)+
            											(tonumber(sheet.xp1_2) or 0);
            					sheet.total1_2 = mod / 2;
            					sheet.total21_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event256 = obj.edit251:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_2) or 0)+
            											(tonumber(sheet.bonus1_2) or 0)+
            											(tonumber(sheet.xp1_2) or 0);
            					sheet.total1_2 = mod / 2;
            					sheet.total21_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event257 = obj.edit252:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_2) or 0)+
            											(tonumber(sheet.bonus1_2) or 0)+
            											(tonumber(sheet.xp1_2) or 0);
            					sheet.total1_2 = mod / 2;
            					sheet.total21_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event258 = obj.button111:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_3) or 0);
            				sheet.rollnome1 = sheet.nome1_3;
        end, obj);

    obj._e_event259 = obj.button112:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_3) or 0);
            				sheet.rollnome2 = sheet.nome1_3;
        end, obj);

    obj._e_event260 = obj.edit255:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_3) or 0)+
            											(tonumber(sheet.bonus1_3) or 0)+
            											(tonumber(sheet.xp1_3) or 0);
            					sheet.total1_3 = mod / 2;
            					sheet.total21_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event261 = obj.edit256:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_3) or 0)+
            											(tonumber(sheet.bonus1_3) or 0)+
            											(tonumber(sheet.xp1_3) or 0);
            					sheet.total1_3 = mod / 2;
            					sheet.total21_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event262 = obj.edit257:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_3) or 0)+
            											(tonumber(sheet.bonus1_3) or 0)+
            											(tonumber(sheet.xp1_3) or 0);
            					sheet.total1_3 = mod / 2;
            					sheet.total21_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event263 = obj.button113:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_4) or 0);
            				sheet.rollnome1 = sheet.nome1_4;
        end, obj);

    obj._e_event264 = obj.button114:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_4) or 0);
            				sheet.rollnome2 = sheet.nome1_4;
        end, obj);

    obj._e_event265 = obj.edit260:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_4) or 0)+
            											(tonumber(sheet.bonus1_4) or 0)+
            											(tonumber(sheet.xp1_4) or 0);
            					sheet.total1_4 = mod / 2;
            					sheet.total21_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event266 = obj.edit261:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_4) or 0)+
            											(tonumber(sheet.bonus1_4) or 0)+
            											(tonumber(sheet.xp1_4) or 0);
            					sheet.total1_4 = mod / 2;
            					sheet.total21_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event267 = obj.edit262:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_4) or 0)+
            											(tonumber(sheet.bonus1_4) or 0)+
            											(tonumber(sheet.xp1_4) or 0);
            					sheet.total1_4 = mod / 2;
            					sheet.total21_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event268 = obj.button115:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_5) or 0);
            				sheet.rollnome1 = sheet.nome1_5;
        end, obj);

    obj._e_event269 = obj.button116:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_5) or 0);
            				sheet.rollnome2 = sheet.nome1_5;
        end, obj);

    obj._e_event270 = obj.edit265:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_5) or 0)+
            											(tonumber(sheet.bonus1_5) or 0)+
            											(tonumber(sheet.xp1_5) or 0);
            					sheet.total1_5 = mod / 2;
            					sheet.total21_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event271 = obj.edit266:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_5) or 0)+
            											(tonumber(sheet.bonus1_5) or 0)+
            											(tonumber(sheet.xp1_5) or 0);
            					sheet.total1_5 = mod / 2;
            					sheet.total21_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event272 = obj.edit267:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_5) or 0)+
            											(tonumber(sheet.bonus1_5) or 0)+
            											(tonumber(sheet.xp1_5) or 0);
            					sheet.total1_5 = mod / 2;
            					sheet.total21_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event273 = obj.button117:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_6) or 0);
            				sheet.rollnome1 = sheet.nome1_6;
        end, obj);

    obj._e_event274 = obj.button118:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_6) or 0);
            				sheet.rollnome2 = sheet.nome1_6;
        end, obj);

    obj._e_event275 = obj.edit270:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_6) or 0)+
            											(tonumber(sheet.bonus1_6) or 0)+
            											(tonumber(sheet.xp1_6) or 0);
            					sheet.total1_6 = mod / 2;
            					sheet.total21_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event276 = obj.edit271:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_6) or 0)+
            											(tonumber(sheet.bonus1_6) or 0)+
            											(tonumber(sheet.xp1_6) or 0);
            					sheet.total1_6 = mod / 2;
            					sheet.total21_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event277 = obj.edit272:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_6) or 0)+
            											(tonumber(sheet.bonus1_6) or 0)+
            											(tonumber(sheet.xp1_6) or 0);
            					sheet.total1_6 = mod / 2;
            					sheet.total21_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event278 = obj.button119:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_7) or 0);
            				sheet.rollnome1 = sheet.nome1_7;
        end, obj);

    obj._e_event279 = obj.button120:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_7) or 0);
            				sheet.rollnome2 = sheet.nome1_7;
        end, obj);

    obj._e_event280 = obj.edit275:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_7) or 0)+
            											(tonumber(sheet.bonus1_7) or 0)+
            											(tonumber(sheet.xp1_7) or 0);
            					sheet.total1_7 = mod / 2;
            					sheet.total21_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event281 = obj.edit276:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_7) or 0)+
            											(tonumber(sheet.bonus1_7) or 0)+
            											(tonumber(sheet.xp1_7) or 0);
            					sheet.total1_7 = mod / 2;
            					sheet.total21_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event282 = obj.edit277:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_7) or 0)+
            											(tonumber(sheet.bonus1_7) or 0)+
            											(tonumber(sheet.xp1_7) or 0);
            					sheet.total1_7 = mod / 2;
            					sheet.total21_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event283 = obj.button121:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_8) or 0);
            				sheet.rollnome1 = sheet.nome1_8;
        end, obj);

    obj._e_event284 = obj.button122:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_8) or 0);
            				sheet.rollnome2 = sheet.nome1_8;
        end, obj);

    obj._e_event285 = obj.edit280:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_8) or 0)+
            											(tonumber(sheet.bonus1_8) or 0)+
            											(tonumber(sheet.xp1_8) or 0);
            					sheet.total1_8 = mod / 2;
            					sheet.total21_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event286 = obj.edit281:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_8) or 0)+
            											(tonumber(sheet.bonus1_8) or 0)+
            											(tonumber(sheet.xp1_8) or 0);
            					sheet.total1_8 = mod / 2;
            					sheet.total21_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event287 = obj.edit282:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_8) or 0)+
            											(tonumber(sheet.bonus1_8) or 0)+
            											(tonumber(sheet.xp1_8) or 0);
            					sheet.total1_8 = mod / 2;
            					sheet.total21_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event288 = obj.button123:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_9) or 0);
            				sheet.rollnome1 = sheet.nome1_9;
        end, obj);

    obj._e_event289 = obj.button124:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_9) or 0);
            				sheet.rollnome2 = sheet.nome1_9;
        end, obj);

    obj._e_event290 = obj.edit285:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_9) or 0)+
            											(tonumber(sheet.bonus1_9) or 0)+
            											(tonumber(sheet.xp1_9) or 0);
            					sheet.total1_9 = mod / 2;
            					sheet.total21_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event291 = obj.edit286:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_9) or 0)+
            											(tonumber(sheet.bonus1_9) or 0)+
            											(tonumber(sheet.xp1_9) or 0);
            					sheet.total1_9 = mod / 2;
            					sheet.total21_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event292 = obj.edit287:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_9) or 0)+
            											(tonumber(sheet.bonus1_9) or 0)+
            											(tonumber(sheet.xp1_9) or 0);
            					sheet.total1_9 = mod / 2;
            					sheet.total21_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event293 = obj.button125:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_10) or 0);
            				sheet.rollnome1 = sheet.nome1_10;
        end, obj);

    obj._e_event294 = obj.button126:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_10) or 0);
            				sheet.rollnome2 = sheet.nome1_10;
        end, obj);

    obj._e_event295 = obj.edit290:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_10) or 0)+
            											(tonumber(sheet.bonus1_10) or 0)+
            											(tonumber(sheet.xp1_10) or 0);
            					sheet.total1_10 = mod / 2;
            					sheet.total21_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event296 = obj.edit291:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_10) or 0)+
            											(tonumber(sheet.bonus1_10) or 0)+
            											(tonumber(sheet.xp1_10) or 0);
            					sheet.total1_10 = mod / 2;
            					sheet.total21_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event297 = obj.edit292:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_10) or 0)+
            											(tonumber(sheet.bonus1_10) or 0)+
            											(tonumber(sheet.xp1_10) or 0);
            					sheet.total1_10 = mod / 2;
            					sheet.total21_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event298 = obj.button127:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_11) or 0);
            				sheet.rollnome1 = sheet.nome1_11;
        end, obj);

    obj._e_event299 = obj.button128:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_11) or 0);
            				sheet.rollnome2 = sheet.nome1_11;
        end, obj);

    obj._e_event300 = obj.edit295:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_11) or 0)+
            											(tonumber(sheet.bonus1_11) or 0)+
            											(tonumber(sheet.xp1_11) or 0);
            					sheet.total1_11 = mod / 2;
            					sheet.total21_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event301 = obj.edit296:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_11) or 0)+
            											(tonumber(sheet.bonus1_11) or 0)+
            											(tonumber(sheet.xp1_11) or 0);
            					sheet.total1_11 = mod / 2;
            					sheet.total21_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event302 = obj.edit297:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_11) or 0)+
            											(tonumber(sheet.bonus1_11) or 0)+
            											(tonumber(sheet.xp1_11) or 0);
            					sheet.total1_11 = mod / 2;
            					sheet.total21_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event303 = obj.button129:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total1_12) or 0);
            				sheet.rollnome1 = sheet.nome1_12;
        end, obj);

    obj._e_event304 = obj.button130:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total1_12) or 0);
            				sheet.rollnome2 = sheet.nome1_12;
        end, obj);

    obj._e_event305 = obj.edit300:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_12) or 0)+
            											(tonumber(sheet.bonus1_12) or 0)+
            											(tonumber(sheet.xp1_12) or 0);
            					sheet.total1_12 = mod / 2;
            					sheet.total21_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event306 = obj.edit301:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_12) or 0)+
            											(tonumber(sheet.bonus1_12) or 0)+
            											(tonumber(sheet.xp1_12) or 0);
            					sheet.total1_12 = mod / 2;
            					sheet.total21_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event307 = obj.edit302:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base1_12) or 0)+
            											(tonumber(sheet.bonus1_12) or 0)+
            											(tonumber(sheet.xp1_12) or 0);
            					sheet.total1_12 = mod / 2;
            					sheet.total21_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event308 = obj.button131:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_1) or 0);
            				sheet.rollnome1 = sheet.nome3_1;
        end, obj);

    obj._e_event309 = obj.button132:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_1) or 0);
            				sheet.rollnome2 = sheet.nome3_1;
        end, obj);

    obj._e_event310 = obj.edit305:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_1) or 0)+
            											(tonumber(sheet.bonus3_1) or 0)+
            											(tonumber(sheet.xp3_1) or 0);
            					sheet.total3_1 = mod / 2;
            					sheet.total23_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event311 = obj.edit306:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_1) or 0)+
            											(tonumber(sheet.bonus3_1) or 0)+
            											(tonumber(sheet.xp3_1) or 0);
            					sheet.total3_1 = mod / 2;
            					sheet.total23_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event312 = obj.edit307:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_1) or 0)+
            											(tonumber(sheet.bonus3_1) or 0)+
            											(tonumber(sheet.xp3_1) or 0);
            					sheet.total3_1 = mod / 2;
            					sheet.total23_1 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event313 = obj.button133:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_2) or 0);
            				sheet.rollnome1 = sheet.nome3_2;
        end, obj);

    obj._e_event314 = obj.button134:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_2) or 0);
            				sheet.rollnome2 = sheet.nome3_2;
        end, obj);

    obj._e_event315 = obj.edit310:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_2) or 0)+
            											(tonumber(sheet.bonus3_2) or 0)+
            											(tonumber(sheet.xp3_2) or 0);
            					sheet.total3_2 = mod / 2;
            					sheet.total23_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event316 = obj.edit311:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_2) or 0)+
            											(tonumber(sheet.bonus3_2) or 0)+
            											(tonumber(sheet.xp3_2) or 0);
            					sheet.total3_2 = mod / 2;
            					sheet.total23_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event317 = obj.edit312:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_2) or 0)+
            											(tonumber(sheet.bonus3_2) or 0)+
            											(tonumber(sheet.xp3_2) or 0);
            					sheet.total3_2 = mod / 2;
            					sheet.total23_2 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event318 = obj.button135:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_3) or 0);
            				sheet.rollnome1 = sheet.nome3_3;
        end, obj);

    obj._e_event319 = obj.button136:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_3) or 0);
            				sheet.rollnome2 = sheet.nome3_3;
        end, obj);

    obj._e_event320 = obj.edit315:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_3) or 0)+
            											(tonumber(sheet.bonus3_3) or 0)+
            											(tonumber(sheet.xp3_3) or 0);
            					sheet.total3_3 = mod / 2;
            					sheet.total23_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event321 = obj.edit316:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_3) or 0)+
            											(tonumber(sheet.bonus3_3) or 0)+
            											(tonumber(sheet.xp3_3) or 0);
            					sheet.total3_3 = mod / 2;
            					sheet.total23_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event322 = obj.edit317:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_3) or 0)+
            											(tonumber(sheet.bonus3_3) or 0)+
            											(tonumber(sheet.xp3_3) or 0);
            					sheet.total3_3 = mod / 2;
            					sheet.total23_3 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event323 = obj.button137:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_4) or 0);
            				sheet.rollnome1 = sheet.nome3_4;
        end, obj);

    obj._e_event324 = obj.button138:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_4) or 0);
            				sheet.rollnome2 = sheet.nome3_4;
        end, obj);

    obj._e_event325 = obj.edit320:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_4) or 0)+
            											(tonumber(sheet.bonus3_4) or 0)+
            											(tonumber(sheet.xp3_4) or 0);
            					sheet.total3_4 = mod / 2;
            					sheet.total23_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event326 = obj.edit321:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_4) or 0)+
            											(tonumber(sheet.bonus3_4) or 0)+
            											(tonumber(sheet.xp3_4) or 0);
            					sheet.total3_4 = mod / 2;
            					sheet.total23_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event327 = obj.edit322:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_4) or 0)+
            											(tonumber(sheet.bonus3_4) or 0)+
            											(tonumber(sheet.xp3_4) or 0);
            					sheet.total3_4 = mod / 2;
            					sheet.total23_4 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event328 = obj.button139:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_5) or 0);
            				sheet.rollnome1 = sheet.nome3_5;
        end, obj);

    obj._e_event329 = obj.button140:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_5) or 0);
            				sheet.rollnome2 = sheet.nome3_5;
        end, obj);

    obj._e_event330 = obj.edit325:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_5) or 0)+
            											(tonumber(sheet.bonus3_5) or 0)+
            											(tonumber(sheet.xp3_5) or 0);
            					sheet.total3_5 = mod / 2;
            					sheet.total23_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event331 = obj.edit326:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_5) or 0)+
            											(tonumber(sheet.bonus3_5) or 0)+
            											(tonumber(sheet.xp3_5) or 0);
            					sheet.total3_5 = mod / 2;
            					sheet.total23_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event332 = obj.edit327:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_5) or 0)+
            											(tonumber(sheet.bonus3_5) or 0)+
            											(tonumber(sheet.xp3_5) or 0);
            					sheet.total3_5 = mod / 2;
            					sheet.total23_5 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event333 = obj.button141:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_6) or 0);
            				sheet.rollnome1 = sheet.nome3_6;
        end, obj);

    obj._e_event334 = obj.button142:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_6) or 0);
            				sheet.rollnome2 = sheet.nome3_6;
        end, obj);

    obj._e_event335 = obj.edit330:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_6) or 0)+
            											(tonumber(sheet.bonus3_6) or 0)+
            											(tonumber(sheet.xp3_6) or 0);
            					sheet.total3_6 = mod / 2;
            					sheet.total23_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event336 = obj.edit331:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_6) or 0)+
            											(tonumber(sheet.bonus3_6) or 0)+
            											(tonumber(sheet.xp3_6) or 0);
            					sheet.total3_6 = mod / 2;
            					sheet.total23_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event337 = obj.edit332:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_6) or 0)+
            											(tonumber(sheet.bonus3_6) or 0)+
            											(tonumber(sheet.xp3_6) or 0);
            					sheet.total3_6 = mod / 2;
            					sheet.total23_6 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event338 = obj.button143:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_7) or 0);
            				sheet.rollnome1 = sheet.nome3_7;
        end, obj);

    obj._e_event339 = obj.button144:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_7) or 0);
            				sheet.rollnome2 = sheet.nome3_7;
        end, obj);

    obj._e_event340 = obj.edit335:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_7) or 0)+
            											(tonumber(sheet.bonus3_7) or 0)+
            											(tonumber(sheet.xp3_7) or 0);
            					sheet.total3_7 = mod / 2;
            					sheet.total23_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event341 = obj.edit336:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_7) or 0)+
            											(tonumber(sheet.bonus3_7) or 0)+
            											(tonumber(sheet.xp3_7) or 0);
            					sheet.total3_7 = mod / 2;
            					sheet.total23_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event342 = obj.edit337:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_7) or 0)+
            											(tonumber(sheet.bonus3_7) or 0)+
            											(tonumber(sheet.xp3_7) or 0);
            					sheet.total3_7 = mod / 2;
            					sheet.total23_7 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event343 = obj.button145:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_8) or 0);
            				sheet.rollnome1 = sheet.nome3_8;
        end, obj);

    obj._e_event344 = obj.button146:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_8) or 0);
            				sheet.rollnome2 = sheet.nome3_8;
        end, obj);

    obj._e_event345 = obj.edit340:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_8) or 0)+
            											(tonumber(sheet.bonus3_8) or 0)+
            											(tonumber(sheet.xp3_8) or 0);
            					sheet.total3_8 = mod / 2;
            					sheet.total23_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event346 = obj.edit341:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_8) or 0)+
            											(tonumber(sheet.bonus3_8) or 0)+
            											(tonumber(sheet.xp3_8) or 0);
            					sheet.total3_8 = mod / 2;
            					sheet.total23_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event347 = obj.edit342:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_8) or 0)+
            											(tonumber(sheet.bonus3_8) or 0)+
            											(tonumber(sheet.xp3_8) or 0);
            					sheet.total3_8 = mod / 2;
            					sheet.total23_8 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event348 = obj.button147:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_9) or 0);
            				sheet.rollnome1 = sheet.nome3_9;
        end, obj);

    obj._e_event349 = obj.button148:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_9) or 0);
            				sheet.rollnome2 = sheet.nome3_9;
        end, obj);

    obj._e_event350 = obj.edit345:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_9) or 0)+
            											(tonumber(sheet.bonus3_9) or 0)+
            											(tonumber(sheet.xp3_9) or 0);
            					sheet.total3_9 = mod / 2;
            					sheet.total23_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event351 = obj.edit346:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_9) or 0)+
            											(tonumber(sheet.bonus3_9) or 0)+
            											(tonumber(sheet.xp3_9) or 0);
            					sheet.total3_9 = mod / 2;
            					sheet.total23_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event352 = obj.edit347:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_9) or 0)+
            											(tonumber(sheet.bonus3_9) or 0)+
            											(tonumber(sheet.xp3_9) or 0);
            					sheet.total3_9 = mod / 2;
            					sheet.total23_9 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event353 = obj.button149:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_10) or 0);
            				sheet.rollnome1 = sheet.nome3_10;
        end, obj);

    obj._e_event354 = obj.button150:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_10) or 0);
            				sheet.rollnome2 = sheet.nome3_10;
        end, obj);

    obj._e_event355 = obj.edit350:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_10) or 0)+
            											(tonumber(sheet.bonus3_10) or 0)+
            											(tonumber(sheet.xp3_10) or 0);
            					sheet.total3_10 = mod / 2;
            					sheet.total23_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event356 = obj.edit351:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_10) or 0)+
            											(tonumber(sheet.bonus3_10) or 0)+
            											(tonumber(sheet.xp3_10) or 0);
            					sheet.total3_10 = mod / 2;
            					sheet.total23_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event357 = obj.edit352:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_10) or 0)+
            											(tonumber(sheet.bonus3_10) or 0)+
            											(tonumber(sheet.xp3_10) or 0);
            					sheet.total3_10 = mod / 2;
            					sheet.total23_10 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event358 = obj.button151:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_11) or 0);
            				sheet.rollnome1 = sheet.nome3_11;
        end, obj);

    obj._e_event359 = obj.button152:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_11) or 0);
            				sheet.rollnome2 = sheet.nome3_11;
        end, obj);

    obj._e_event360 = obj.edit355:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_11) or 0)+
            											(tonumber(sheet.bonus3_11) or 0)+
            											(tonumber(sheet.xp3_11) or 0);
            					sheet.total3_11 = mod / 2;
            					sheet.total23_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event361 = obj.edit356:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_11) or 0)+
            											(tonumber(sheet.bonus3_11) or 0)+
            											(tonumber(sheet.xp3_11) or 0);
            					sheet.total3_11 = mod / 2;
            					sheet.total23_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event362 = obj.edit357:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_11) or 0)+
            											(tonumber(sheet.bonus3_11) or 0)+
            											(tonumber(sheet.xp3_11) or 0);
            					sheet.total3_11 = mod / 2;
            					sheet.total23_11 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event363 = obj.button153:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field1 = true;
            				sheet.num1 = (tonumber(sheet.total3_12) or 0);
            				sheet.rollnome1 = sheet.nome3_12;
        end, obj);

    obj._e_event364 = obj.button154:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				sheet.field2 = true;
            				sheet.num2 = (tonumber(sheet.total3_12) or 0);
            				sheet.rollnome2 = sheet.nome3_12;
        end, obj);

    obj._e_event365 = obj.edit360:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_12) or 0)+
            											(tonumber(sheet.bonus3_12) or 0)+
            											(tonumber(sheet.xp3_12) or 0);
            					sheet.total3_12 = mod / 2;
            					sheet.total23_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event366 = obj.edit361:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_12) or 0)+
            											(tonumber(sheet.bonus3_12) or 0)+
            											(tonumber(sheet.xp3_12) or 0);
            					sheet.total3_12 = mod / 2;
            					sheet.total23_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event367 = obj.edit362:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            					local mod = (tonumber(sheet.base3_12) or 0)+
            											(tonumber(sheet.bonus3_12) or 0)+
            											(tonumber(sheet.xp3_12) or 0);
            					sheet.total3_12 = mod / 2;
            					sheet.total23_12 = mod .. " | " .. mod / 2;
            				end;
        end, obj);

    obj._e_event368 = obj.button155:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            					sheet.field2 = nil;
            					sheet.num2 = nil;
            					sheet.nome2 = nil;
        end, obj);

    obj._e_event369 = obj.button156:addEventListener("onClick",
        function (_)
            rolar();
        end, obj);

    obj._e_event370 = obj.button157:addEventListener("onClick",
        function (_)
            System.setClipboardText(sheet.historia);
        end, obj);

    obj._e_event371 = obj.comboBox3:addEventListener("onChange",
        function (_)
            if sheet == nil then return end;
            					local theme = sheet.theme;
            					if theme == "Claro" then
            						theme = "light";
            					else
            						theme = "dark";
            					end;
            
            					local forms = findClass("form");
            
            					for i=1, #forms, 1 do 
            						forms[i].theme = theme;
            					end;
        end, obj);

    obj._e_event372 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event373 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event374 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fontColor = sheet.colorFont or "#FFFFFF";
            
            					local controls = findAllControls();
            					
            					local edits = filterByClass("edit", controls);
            					for i=1, #edits, 1 do 
            						edits[i].fontColor = fontColor;
            					end;
            
            					local labels = filterByClass("label", controls);
            					for i=1, #labels, 1 do 
            						labels[i].fontColor = fontColor;
            					end;
            
            					local comboBoxs = filterByClass("comboBox", controls);
            					for i=1, #comboBoxs, 1 do 
            						comboBoxs[i].fontColor = fontColor;
            					end;
            
            					local textEditors = filterByClass("textEditor", controls);
            					for i=1, #textEditors, 1 do 
            						textEditors[i].fontColor = fontColor;
            					end;
            
            					local checkBoxs = filterByClass("checkBox", controls);
            					for i=1, #checkBoxs, 1 do 
            						checkBoxs[i].fontColor = fontColor;
            					end;
            
            					local buttons = filterByClass("button", controls);
            					for i=1, #buttons, 1 do 
            						buttons[i].fontColor = fontColor;
            					end;
        end, obj);

    obj._e_event375 = obj.button158:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/README.md')
        end, obj);

    obj._e_event376 = obj.button159:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ao%20cair%20da%20noite/output/Ao%20cair%20da%20noite.rpk?raw=true')
        end, obj);

    obj._e_event377 = obj.button160:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event378 = obj.button161:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=97151');
        end, obj);

    obj._e_event379 = obj.button162:addEventListener("onClick",
        function (_)
            local xml = NDB.exportXML(sheet);
            
            				local export = {};
            				local bytes = Utils.binaryEncode(export, "utf8", xml);
            
            				local stream = Utils.newMemoryStream();
            				local bytes = stream:write(export);
            
            				Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml",
            					function()
            						stream:close();
            						showMessage("Ficha Exportada.");
            					end);
        end, obj);

    obj._e_event380 = obj.button163:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            
            						local import = {};
            						local bytes = arq.stream:read(import, arq.stream.size);
            
            						local xml = Utils.binaryDecode(import, "utf8");
            
            						NDB.importXML(sheet, xml);
            					end);
        end, obj);

    obj._e_event381 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fisicos = (tonumber(sheet.inicialforca) or 0) + 
            									(tonumber(sheet.inicialagilidade) or 0) + 
            									(tonumber(sheet.inicialresiliencia) or 0);
            					sheet.auditini_atrFis = fisicos;
        end, obj);

    obj._e_event382 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fisicos = (tonumber(sheet.bonusforca) or 0) + 
            									(tonumber(sheet.bonusagilidade) or 0) + 
            									(tonumber(sheet.bonusresiliencia) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_atrFis) or 1);
            					sheet.auditbonus_atrFis = fisicos * mult;
        end, obj);

    obj._e_event383 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fisicos = 0;
            					local mult = (tonumber(sheet.auditxpcost_atrFis) or 1);
            
            					local valores = {   ((tonumber(sheet.testeforca) or 0)*2 - (tonumber(sheet.xpforca) or 0)), 
            										((tonumber(sheet.testeagilidade) or 0)*2 - (tonumber(sheet.xpagilidade) or 0)), 
            										((tonumber(sheet.testeresiliencia) or 0)*2 - (tonumber(sheet.xpresiliencia) or 0)) };
            					
            					local limites = {	(tonumber(sheet.xpforca) or 0),
            										(tonumber(sheet.xpagilidade) or 0),
            										(tonumber(sheet.xpresiliencia) or 0)}
            					
            					for i=1, 3, 1 do
            						for j=1, limites[i], 1 do
            							fisicos = fisicos + (valores[i]+j)*mult;
            						end;
            					end;
            
            
            					sheet.auditxp_atrFis = fisicos;
        end, obj);

    obj._e_event384 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.inicialcarisma) or 0) + 
            									(tonumber(sheet.inicialpercepcao) or 0) + 
            									(tonumber(sheet.inicialperspicacia) or 0);
            					sheet.auditini_atrMen = mentais;
        end, obj);

    obj._e_event385 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.bonuscarisma) or 0) + 
            									(tonumber(sheet.bonuspercepcao) or 0) + 
            									(tonumber(sheet.bonusperspicacia) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_atrMen) or 1);
            					sheet.auditbonus_atrMen = mentais * mult;
        end, obj);

    obj._e_event386 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = 0;
            					local mult = (tonumber(sheet.auditxpcost_atrMen) or 1);
            
            					local valores = {   ((tonumber(sheet.testecarisma) or 0)*2 - (tonumber(sheet.xpcarisma) or 0)), 
            										((tonumber(sheet.testepercepcao) or 0)*2 - (tonumber(sheet.xppercepcao) or 0)),
            										((tonumber(sheet.testeperspicacia) or 0)*2 - (tonumber(sheet.xpperspicacia) or 0)) };
            					
            					local limites = {	(tonumber(sheet.xpcarisma) or 0),
            										(tonumber(sheet.xppercepcao) or 0),
            										(tonumber(sheet.xpperspicacia) or 0)}
            					
            					for i=1, 3, 1 do
            						for j=1, limites[i], 1 do
            							mentais = mentais + (valores[i]+j)*mult;
            						end;
            					end;
            					sheet.auditxp_atrMen = mentais;
        end, obj);

    obj._e_event387 = obj.dataLink53:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            					local fisicos = (tonumber(sheet.base0_1) or 0) + (tonumber(sheet.base0_2) or 0) + (tonumber(sheet.base0_3) or 0) + (tonumber(sheet.base0_4) or 0) + (tonumber(sheet.base0_5) or 0) + (tonumber(sheet.base0_6) or 0) + (tonumber(sheet.base0_7) or 0) + (tonumber(sheet.base0_8) or 0) + (tonumber(sheet.base0_9) or 0) + (tonumber(sheet.base0_10) or 0) + (tonumber(sheet.base0_11) or 0) + (tonumber(sheet.base0_12) or 0) + (tonumber(sheet.base2_1) or 0) + (tonumber(sheet.base2_2) or 0) + (tonumber(sheet.base2_3) or 0) + (tonumber(sheet.base2_4) or 0) + (tonumber(sheet.base2_5) or 0) + (tonumber(sheet.base2_6) or 0) + (tonumber(sheet.base2_7) or 0) + (tonumber(sheet.base2_8) or 0) + (tonumber(sheet.base2_9) or 0) + (tonumber(sheet.base2_10) or 0) + (tonumber(sheet.base2_11) or 0) + (tonumber(sheet.base2_12) or 0);
            					sheet.auditini_aptFis = fisicos;
        end, obj);

    obj._e_event388 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            					local fisicos = (tonumber(sheet.bonus0_1) or 0) + (tonumber(sheet.bonus0_2) or 0) + (tonumber(sheet.bonus0_3) or 0) + (tonumber(sheet.bonus0_4) or 0) + (tonumber(sheet.bonus0_5) or 0) + (tonumber(sheet.bonus0_6) or 0) + (tonumber(sheet.bonus0_7) or 0) + (tonumber(sheet.bonus0_8) or 0) + (tonumber(sheet.bonus0_9) or 0) + (tonumber(sheet.bonus0_10) or 0) + (tonumber(sheet.bonus0_11) or 0) + (tonumber(sheet.bonus0_12) or 0) + (tonumber(sheet.bonus2_1) or 0) + (tonumber(sheet.bonus2_2) or 0) + (tonumber(sheet.bonus2_3) or 0) + (tonumber(sheet.bonus2_4) or 0) + (tonumber(sheet.bonus2_5) or 0) + (tonumber(sheet.bonus2_6) or 0) + (tonumber(sheet.bonus2_7) or 0) + (tonumber(sheet.bonus2_8) or 0) + (tonumber(sheet.bonus2_9) or 0) + (tonumber(sheet.bonus2_10) or 0) + (tonumber(sheet.bonus2_11) or 0) + (tonumber(sheet.bonus2_12) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_aptFis) or 1);
            					sheet.auditbonus_aptFis = fisicos * mult;
        end, obj);

    obj._e_event389 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            					local fisicos = 0;
            					local mult = (tonumber(sheet.auditxpcost_aptFis) or 1);
            
            					local valores = {   ((tonumber(sheet.total0_1 ) or 0)*2 - (tonumber(sheet.xp0_1 ) or 0)), 
            										((tonumber(sheet.total0_2 ) or 0)*2 - (tonumber(sheet.xp0_2 ) or 0)), 
            										((tonumber(sheet.total0_3 ) or 0)*2 - (tonumber(sheet.xp0_3 ) or 0)),
            										((tonumber(sheet.total0_4 ) or 0)*2 - (tonumber(sheet.xp0_4 ) or 0)),
            										((tonumber(sheet.total0_5 ) or 0)*2 - (tonumber(sheet.xp0_5 ) or 0)),
            										((tonumber(sheet.total0_6 ) or 0)*2 - (tonumber(sheet.xp0_6 ) or 0)),
            										((tonumber(sheet.total0_7 ) or 0)*2 - (tonumber(sheet.xp0_7 ) or 0)),
            										((tonumber(sheet.total0_8 ) or 0)*2 - (tonumber(sheet.xp0_8 ) or 0)),
            										((tonumber(sheet.total0_9 ) or 0)*2 - (tonumber(sheet.xp0_9 ) or 0)),
            										((tonumber(sheet.total0_10) or 0)*2 - (tonumber(sheet.xp0_10) or 0)),
            										((tonumber(sheet.total0_11) or 0)*2 - (tonumber(sheet.xp0_11) or 0)),
            										((tonumber(sheet.total0_12) or 0)*2 - (tonumber(sheet.xp0_12) or 0)),
            										((tonumber(sheet.total2_1 ) or 0)*2 - (tonumber(sheet.xp2_1 ) or 0)),
            										((tonumber(sheet.total2_2 ) or 0)*2 - (tonumber(sheet.xp2_2 ) or 0)),
            										((tonumber(sheet.total2_3 ) or 0)*2 - (tonumber(sheet.xp2_3 ) or 0)),
            										((tonumber(sheet.total2_4 ) or 0)*2 - (tonumber(sheet.xp2_4 ) or 0)),
            										((tonumber(sheet.total2_5 ) or 0)*2 - (tonumber(sheet.xp2_5 ) or 0)),
            										((tonumber(sheet.total2_6 ) or 0)*2 - (tonumber(sheet.xp2_6 ) or 0)),
            										((tonumber(sheet.total2_7 ) or 0)*2 - (tonumber(sheet.xp2_7 ) or 0)),
            										((tonumber(sheet.total2_8 ) or 0)*2 - (tonumber(sheet.xp2_8 ) or 0)),
            										((tonumber(sheet.total2_9 ) or 0)*2 - (tonumber(sheet.xp2_9 ) or 0)),
            										((tonumber(sheet.total2_10) or 0)*2 - (tonumber(sheet.xp2_10) or 0)),
            										((tonumber(sheet.total2_11) or 0)*2 - (tonumber(sheet.xp2_11) or 0)),
            										((tonumber(sheet.total2_12) or 0)*2 - (tonumber(sheet.xp2_12) or 0))
            										};
            			
            					local limites = {	(tonumber(sheet.xp0_1 ) or 0),
            										(tonumber(sheet.xp0_2 ) or 0),
            										(tonumber(sheet.xp0_3 ) or 0),
            										(tonumber(sheet.xp0_4 ) or 0),
            										(tonumber(sheet.xp0_5 ) or 0),
            										(tonumber(sheet.xp0_6 ) or 0),
            										(tonumber(sheet.xp0_7 ) or 0),
            										(tonumber(sheet.xp0_8 ) or 0),
            										(tonumber(sheet.xp0_9 ) or 0),
            										(tonumber(sheet.xp0_10) or 0),
            										(tonumber(sheet.xp0_11) or 0),
            										(tonumber(sheet.xp0_12) or 0),
            										(tonumber(sheet.xp2_1 ) or 0),
            										(tonumber(sheet.xp2_2 ) or 0),
            										(tonumber(sheet.xp2_3 ) or 0),
            										(tonumber(sheet.xp2_4 ) or 0),
            										(tonumber(sheet.xp2_5 ) or 0),
            										(tonumber(sheet.xp2_6 ) or 0),
            										(tonumber(sheet.xp2_7 ) or 0),
            										(tonumber(sheet.xp2_8 ) or 0),
            										(tonumber(sheet.xp2_9 ) or 0),
            										(tonumber(sheet.xp2_10) or 0),
            										(tonumber(sheet.xp2_11) or 0),
            										(tonumber(sheet.xp2_12) or 0)
            										};
            			
            					for i=1, 24, 1 do
            						for j=1, limites[i], 1 do
            							fisicos = fisicos + math.max(math.floor((valores[i]+j)*mult), 2*mult);
            						end;
            					end;
            					sheet.auditxp_aptFis = fisicos;
        end, obj);

    obj._e_event390 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.base1_1) or 0) + (tonumber(sheet.base1_2) or 0) + (tonumber(sheet.base1_3) or 0) + (tonumber(sheet.base1_4) or 0) + (tonumber(sheet.base1_5) or 0) + (tonumber(sheet.base1_6) or 0) + (tonumber(sheet.base1_7) or 0) + (tonumber(sheet.base1_8) or 0) + (tonumber(sheet.base1_9) or 0) + (tonumber(sheet.base1_10) or 0) + (tonumber(sheet.base1_11) or 0) + (tonumber(sheet.base1_12) or 0) + (tonumber(sheet.base3_1) or 0) + (tonumber(sheet.base3_2) or 0) + (tonumber(sheet.base3_3) or 0) + (tonumber(sheet.base3_4) or 0) + (tonumber(sheet.base3_5) or 0) + (tonumber(sheet.base3_6) or 0) + (tonumber(sheet.base3_7) or 0) + (tonumber(sheet.base3_8) or 0) + (tonumber(sheet.base3_9) or 0) + (tonumber(sheet.base3_10) or 0) + (tonumber(sheet.base3_11) or 0) + (tonumber(sheet.base3_12) or 0);
            					sheet.auditini_aptMen = mentais;
        end, obj);

    obj._e_event391 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = (tonumber(sheet.bonus1_1) or 0) + (tonumber(sheet.bonus1_2) or 0) + (tonumber(sheet.bonus1_3) or 0) + (tonumber(sheet.bonus1_4) or 0) + (tonumber(sheet.bonus1_5) or 0) + (tonumber(sheet.bonus1_6) or 0) + (tonumber(sheet.bonus1_7) or 0) + (tonumber(sheet.bonus1_8) or 0) + (tonumber(sheet.bonus1_9) or 0) + (tonumber(sheet.bonus1_10) or 0) + (tonumber(sheet.bonus1_11) or 0) + (tonumber(sheet.bonus1_12) or 0) + (tonumber(sheet.bonus3_1) or 0) + (tonumber(sheet.bonus3_2) or 0) + (tonumber(sheet.bonus3_3) or 0) + (tonumber(sheet.bonus3_4) or 0) + (tonumber(sheet.bonus3_5) or 0) + (tonumber(sheet.bonus3_6) or 0) + (tonumber(sheet.bonus3_7) or 0) + (tonumber(sheet.bonus3_8) or 0) + (tonumber(sheet.bonus3_9) or 0) + (tonumber(sheet.bonus3_10) or 0) + (tonumber(sheet.bonus3_11) or 0) + (tonumber(sheet.bonus3_12) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_aptMen) or 1);
            					sheet.auditbonus_aptMen = mentais * mult;
        end, obj);

    obj._e_event392 = obj.dataLink58:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local mentais = 0;
            					local mult = (tonumber(sheet.auditxpcost_aptMen) or 1);
            
            					local valores = {   ((tonumber(sheet.total1_1 ) or 0)*2 - (tonumber(sheet.xp1_1 ) or 0)),
            										((tonumber(sheet.total1_2 ) or 0)*2 - (tonumber(sheet.xp1_2 ) or 0)),
            										((tonumber(sheet.total1_3 ) or 0)*2 - (tonumber(sheet.xp1_3 ) or 0)),
            										((tonumber(sheet.total1_4 ) or 0)*2 - (tonumber(sheet.xp1_4 ) or 0)),
            										((tonumber(sheet.total1_5 ) or 0)*2 - (tonumber(sheet.xp1_5 ) or 0)),
            										((tonumber(sheet.total1_6 ) or 0)*2 - (tonumber(sheet.xp1_6 ) or 0)),
            										((tonumber(sheet.total1_7 ) or 0)*2 - (tonumber(sheet.xp1_7 ) or 0)),
            										((tonumber(sheet.total1_8 ) or 0)*2 - (tonumber(sheet.xp1_8 ) or 0)),
            										((tonumber(sheet.total1_9 ) or 0)*2 - (tonumber(sheet.xp1_9 ) or 0)),
            										((tonumber(sheet.total1_10) or 0)*2 - (tonumber(sheet.xp1_10) or 0)),
            										((tonumber(sheet.total1_11) or 0)*2 - (tonumber(sheet.xp1_11) or 0)),
            										((tonumber(sheet.total1_12) or 0)*2 - (tonumber(sheet.xp1_12) or 0)),
            										((tonumber(sheet.total3_1 ) or 0)*2 - (tonumber(sheet.xp3_1 ) or 0)),
            										((tonumber(sheet.total3_2 ) or 0)*2 - (tonumber(sheet.xp3_2 ) or 0)),
            										((tonumber(sheet.total3_3 ) or 0)*2 - (tonumber(sheet.xp3_3 ) or 0)),
            										((tonumber(sheet.total3_4 ) or 0)*2 - (tonumber(sheet.xp3_4 ) or 0)),
            										((tonumber(sheet.total3_5 ) or 0)*2 - (tonumber(sheet.xp3_5 ) or 0)),
            										((tonumber(sheet.total3_6 ) or 0)*2 - (tonumber(sheet.xp3_6 ) or 0)),
            										((tonumber(sheet.total3_7 ) or 0)*2 - (tonumber(sheet.xp3_7 ) or 0)),
            										((tonumber(sheet.total3_8 ) or 0)*2 - (tonumber(sheet.xp3_8 ) or 0)),
            										((tonumber(sheet.total3_9 ) or 0)*2 - (tonumber(sheet.xp3_9 ) or 0)),
            										((tonumber(sheet.total3_10) or 0)*2 - (tonumber(sheet.xp3_10) or 0)),
            										((tonumber(sheet.total3_11) or 0)*2 - (tonumber(sheet.xp3_11) or 0)),
            										((tonumber(sheet.total3_12) or 0)*2 - (tonumber(sheet.xp3_12) or 0))
            										};
            			
            					local limites = {	(tonumber(sheet.xp1_1 ) or 0),
            										(tonumber(sheet.xp1_2 ) or 0),
            										(tonumber(sheet.xp1_3 ) or 0),
            										(tonumber(sheet.xp1_4 ) or 0),
            										(tonumber(sheet.xp1_5 ) or 0),
            										(tonumber(sheet.xp1_6 ) or 0),
            										(tonumber(sheet.xp1_7 ) or 0),
            										(tonumber(sheet.xp1_8 ) or 0),
            										(tonumber(sheet.xp1_9 ) or 0),
            										(tonumber(sheet.xp1_10) or 0),
            										(tonumber(sheet.xp1_11) or 0),
            										(tonumber(sheet.xp1_12) or 0),
            										(tonumber(sheet.xp3_1 ) or 0),
            										(tonumber(sheet.xp3_2 ) or 0),
            										(tonumber(sheet.xp3_3 ) or 0),
            										(tonumber(sheet.xp3_4 ) or 0),
            										(tonumber(sheet.xp3_5 ) or 0),
            										(tonumber(sheet.xp3_6 ) or 0),
            										(tonumber(sheet.xp3_7 ) or 0),
            										(tonumber(sheet.xp3_8 ) or 0),
            										(tonumber(sheet.xp3_9 ) or 0),
            										(tonumber(sheet.xp3_10) or 0),
            										(tonumber(sheet.xp3_11) or 0),
            										(tonumber(sheet.xp3_12) or 0)
            										};
            			
            					for i=1, 24, 1 do
            						for j=1, limites[i], 1 do
            							mentais = mentais + math.max(math.floor((valores[i]+j)*mult), 2*mult);
            						end;
            					end;
            					sheet.auditxp_aptMen = mentais;
        end, obj);

    obj._e_event393 = obj.dataLink59:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local historico = (tonumber(sheet.historicoValor1_1) or 0) + (tonumber(sheet.historicoValor1_2) or 0) + (tonumber(sheet.historicoValor1_3) or 0) + (tonumber(sheet.historicoValor1_4) or 0) + (tonumber(sheet.historicoValor1_5) or 0) + (tonumber(sheet.historicoValor1_6) or 0) + (tonumber(sheet.historicoValor2_1) or 0) + (tonumber(sheet.historicoValor2_2) or 0) + (tonumber(sheet.historicoValor2_3) or 0) + (tonumber(sheet.historicoValor2_4) or 0) + (tonumber(sheet.historicoValor2_5) or 0) + (tonumber(sheet.historicoValor2_6) or 0) + (tonumber(sheet.historicoValor3_1) or 0) + (tonumber(sheet.historicoValor3_2) or 0) + (tonumber(sheet.historicoValor3_3) or 0) + (tonumber(sheet.historicoValor3_4) or 0) + (tonumber(sheet.historicoValor3_5) or 0) + (tonumber(sheet.historicoValor3_6) or 0);
            					sheet.auditini_hist = historico;
        end, obj);

    obj._e_event394 = obj.dataLink60:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local historico = (tonumber(sheet.historicoBonus1_1) or 0) + (tonumber(sheet.historicoBonus1_2) or 0) + (tonumber(sheet.historicoBonus1_3) or 0) + (tonumber(sheet.historicoBonus1_4) or 0) + (tonumber(sheet.historicoBonus1_5) or 0) + (tonumber(sheet.historicoBonus1_6) or 0) + (tonumber(sheet.historicoBonus2_1) or 0) + (tonumber(sheet.historicoBonus2_2) or 0) + (tonumber(sheet.historicoBonus2_3) or 0) + (tonumber(sheet.historicoBonus2_4) or 0) + (tonumber(sheet.historicoBonus2_5) or 0) + (tonumber(sheet.historicoBonus2_6) or 0) + (tonumber(sheet.historicoBonus3_1) or 0) + (tonumber(sheet.historicoBonus3_2) or 0) + (tonumber(sheet.historicoBonus3_3) or 0) + (tonumber(sheet.historicoBonus3_4) or 0) + (tonumber(sheet.historicoBonus3_5) or 0) + (tonumber(sheet.historicoBonus3_6) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_hist) or 1);
            					sheet.auditbonus_hist = historico * mult;
        end, obj);

    obj._e_event395 = obj.dataLink61:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local historicos = 0;
            					local mult = (tonumber(sheet.auditxpcost_hist) or 1);
            
            					local valores = {   ((tonumber(sheet.historicoTotal1_1) or 0) - (tonumber(sheet.historicoXp1_1) or 0)), 
            										((tonumber(sheet.historicoTotal1_2) or 0) - (tonumber(sheet.historicoXp1_2) or 0)), 
            										((tonumber(sheet.historicoTotal1_3) or 0) - (tonumber(sheet.historicoXp1_3) or 0)),
            										((tonumber(sheet.historicoTotal1_4) or 0) - (tonumber(sheet.historicoXp1_4) or 0)),
            										((tonumber(sheet.historicoTotal1_5) or 0) - (tonumber(sheet.historicoXp1_5) or 0)),
            										((tonumber(sheet.historicoTotal1_6) or 0) - (tonumber(sheet.historicoXp1_6) or 0)),
            										((tonumber(sheet.historicoTotal2_1) or 0) - (tonumber(sheet.historicoXp2_1) or 0)),
            										((tonumber(sheet.historicoTotal2_2) or 0) - (tonumber(sheet.historicoXp2_2) or 0)),
            										((tonumber(sheet.historicoTotal2_3) or 0) - (tonumber(sheet.historicoXp2_3) or 0)),
            										((tonumber(sheet.historicoTotal2_4) or 0) - (tonumber(sheet.historicoXp2_4) or 0)),
            										((tonumber(sheet.historicoTotal2_5) or 0) - (tonumber(sheet.historicoXp2_5) or 0)),
            										((tonumber(sheet.historicoTotal2_6) or 0) - (tonumber(sheet.historicoXp2_6) or 0)),
            										((tonumber(sheet.historicoTotal3_1) or 0) - (tonumber(sheet.historicoXp3_1) or 0)),
            										((tonumber(sheet.historicoTotal3_2) or 0) - (tonumber(sheet.historicoXp3_2) or 0)),
            										((tonumber(sheet.historicoTotal3_3) or 0) - (tonumber(sheet.historicoXp3_3) or 0)),
            										((tonumber(sheet.historicoTotal3_4) or 0) - (tonumber(sheet.historicoXp3_4) or 0)),
            										((tonumber(sheet.historicoTotal3_5) or 0) - (tonumber(sheet.historicoXp3_5) or 0)),
            										((tonumber(sheet.historicoTotal3_6) or 0) - (tonumber(sheet.historicoXp3_6) or 0)),
            										};
            							
            					local limites = {	(tonumber(sheet.historicoXp1_1) or 0),
            										(tonumber(sheet.historicoXp1_2) or 0),
            										(tonumber(sheet.historicoXp1_3) or 0),
            										(tonumber(sheet.historicoXp1_4) or 0),
            										(tonumber(sheet.historicoXp1_5) or 0),
            										(tonumber(sheet.historicoXp1_6) or 0),
            										(tonumber(sheet.historicoXp2_1) or 0),
            										(tonumber(sheet.historicoXp2_2) or 0),
            										(tonumber(sheet.historicoXp2_3) or 0),
            										(tonumber(sheet.historicoXp2_4) or 0),
            										(tonumber(sheet.historicoXp2_5) or 0),
            										(tonumber(sheet.historicoXp2_6) or 0),
            										(tonumber(sheet.historicoXp3_1) or 0),
            										(tonumber(sheet.historicoXp3_2) or 0),
            										(tonumber(sheet.historicoXp3_3) or 0),
            										(tonumber(sheet.historicoXp3_4) or 0),
            										(tonumber(sheet.historicoXp3_5) or 0),
            										(tonumber(sheet.historicoXp3_6) or 0)
            										};
            							
            					for i=1, 18, 1 do
            						for j=1, limites[i], 1 do
            							historicos = historicos + (valores[i]+j)*mult;
            						end;
            					end;
            					sheet.auditxp_hist = historicos;
        end, obj);

    obj._e_event396 = obj.dataLink62:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local eidolon = (tonumber(sheet.inicialconsciencia) or 0) + (tonumber(sheet.inicialespirito) or 0) + (tonumber(sheet.inicialperseveranca) or 0);
            					sheet.auditini_eido = eidolon;
        end, obj);

    obj._e_event397 = obj.dataLink63:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local eidolon = (tonumber(sheet.bonusconsciencia) or 0) + (tonumber(sheet.bonusespirito) or 0) + (tonumber(sheet.bonusperseveranca) or 0);
            					local mult = (tonumber(sheet.auditbonuscost_eido) or 1);
            					sheet.auditbonus_eido = eidolon * mult;
        end, obj);

    obj._e_event398 = obj.dataLink64:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local aegis = 0;
            					local mult = (tonumber(sheet.auditxpcost_eido) or 1);
            
            					local valores = {   ((tonumber(sheet.testeconsciencia) or 0) - (tonumber(sheet.xpconsciencia) or 0)), 
            										((tonumber(sheet.testeespirito) or 0) - (tonumber(sheet.xpespirito) or 0)), 
            										((tonumber(sheet.testeperseveranca) or 0) - (tonumber(sheet.xpperseveranca) or 0))};
            					
            					local limites = {	(tonumber(sheet.xpconsciencia) or 0),
            										(tonumber(sheet.xpespirito) or 0),
            										(tonumber(sheet.xpperseveranca) or 0)}
            					
            					for i=1, 3, 1 do
            						for j=1, limites[i], 1 do
            							aegis = aegis + (valores[i]+j) * mult;
            						end;
            					end;
            
            					sheet.auditxp_eido = aegis * mult;
        end, obj);

    obj._e_event399 = obj.dataLink65:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local bonus = 	(tonumber(sheet.auditbonus_atrFis) or 0) + 
            									(tonumber(sheet.auditbonus_atrMen) or 0) + 
            									(tonumber(sheet.auditbonus_aptFis) or 0) + 
            									(tonumber(sheet.auditbonus_aptMen) or 0) + 
            									(tonumber(sheet.auditbonus_hist) or 0) + 
            									(tonumber(sheet.auditbonus_eido) or 0) + 
            									(tonumber(sheet.auditbonus_out) or 0) + 
            									(tonumber(sheet.auditbonus_espec) or 0) + 
            									(tonumber(sheet.auditbonus_extra) or 0);
            					sheet.auditbonus_total = bonus;
        end, obj);

    obj._e_event400 = obj.dataLink66:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local xp = 	(tonumber(sheet.auditxp_atrFis) or 0) + 
            									(tonumber(sheet.auditxp_atrMen) or 0) + 
            									(tonumber(sheet.auditxp_aptFis) or 0) + 
            									(tonumber(sheet.auditxp_aptMen) or 0) + 
            									(tonumber(sheet.auditxp_hist) or 0) + 
            									(tonumber(sheet.auditxp_eido) or 0) + 
            									(tonumber(sheet.auditxp_out) or 0) + 
            									(tonumber(sheet.auditxp_espec) or 0) + 
            									(tonumber(sheet.auditxp_extra) or 0);
            					sheet.auditxp_total = xp;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event400);
        __o_rrpgObjs.removeEventListenerById(self._e_event399);
        __o_rrpgObjs.removeEventListenerById(self._e_event398);
        __o_rrpgObjs.removeEventListenerById(self._e_event397);
        __o_rrpgObjs.removeEventListenerById(self._e_event396);
        __o_rrpgObjs.removeEventListenerById(self._e_event395);
        __o_rrpgObjs.removeEventListenerById(self._e_event394);
        __o_rrpgObjs.removeEventListenerById(self._e_event393);
        __o_rrpgObjs.removeEventListenerById(self._e_event392);
        __o_rrpgObjs.removeEventListenerById(self._e_event391);
        __o_rrpgObjs.removeEventListenerById(self._e_event390);
        __o_rrpgObjs.removeEventListenerById(self._e_event389);
        __o_rrpgObjs.removeEventListenerById(self._e_event388);
        __o_rrpgObjs.removeEventListenerById(self._e_event387);
        __o_rrpgObjs.removeEventListenerById(self._e_event386);
        __o_rrpgObjs.removeEventListenerById(self._e_event385);
        __o_rrpgObjs.removeEventListenerById(self._e_event384);
        __o_rrpgObjs.removeEventListenerById(self._e_event383);
        __o_rrpgObjs.removeEventListenerById(self._e_event382);
        __o_rrpgObjs.removeEventListenerById(self._e_event381);
        __o_rrpgObjs.removeEventListenerById(self._e_event380);
        __o_rrpgObjs.removeEventListenerById(self._e_event379);
        __o_rrpgObjs.removeEventListenerById(self._e_event378);
        __o_rrpgObjs.removeEventListenerById(self._e_event377);
        __o_rrpgObjs.removeEventListenerById(self._e_event376);
        __o_rrpgObjs.removeEventListenerById(self._e_event375);
        __o_rrpgObjs.removeEventListenerById(self._e_event374);
        __o_rrpgObjs.removeEventListenerById(self._e_event373);
        __o_rrpgObjs.removeEventListenerById(self._e_event372);
        __o_rrpgObjs.removeEventListenerById(self._e_event371);
        __o_rrpgObjs.removeEventListenerById(self._e_event370);
        __o_rrpgObjs.removeEventListenerById(self._e_event369);
        __o_rrpgObjs.removeEventListenerById(self._e_event368);
        __o_rrpgObjs.removeEventListenerById(self._e_event367);
        __o_rrpgObjs.removeEventListenerById(self._e_event366);
        __o_rrpgObjs.removeEventListenerById(self._e_event365);
        __o_rrpgObjs.removeEventListenerById(self._e_event364);
        __o_rrpgObjs.removeEventListenerById(self._e_event363);
        __o_rrpgObjs.removeEventListenerById(self._e_event362);
        __o_rrpgObjs.removeEventListenerById(self._e_event361);
        __o_rrpgObjs.removeEventListenerById(self._e_event360);
        __o_rrpgObjs.removeEventListenerById(self._e_event359);
        __o_rrpgObjs.removeEventListenerById(self._e_event358);
        __o_rrpgObjs.removeEventListenerById(self._e_event357);
        __o_rrpgObjs.removeEventListenerById(self._e_event356);
        __o_rrpgObjs.removeEventListenerById(self._e_event355);
        __o_rrpgObjs.removeEventListenerById(self._e_event354);
        __o_rrpgObjs.removeEventListenerById(self._e_event353);
        __o_rrpgObjs.removeEventListenerById(self._e_event352);
        __o_rrpgObjs.removeEventListenerById(self._e_event351);
        __o_rrpgObjs.removeEventListenerById(self._e_event350);
        __o_rrpgObjs.removeEventListenerById(self._e_event349);
        __o_rrpgObjs.removeEventListenerById(self._e_event348);
        __o_rrpgObjs.removeEventListenerById(self._e_event347);
        __o_rrpgObjs.removeEventListenerById(self._e_event346);
        __o_rrpgObjs.removeEventListenerById(self._e_event345);
        __o_rrpgObjs.removeEventListenerById(self._e_event344);
        __o_rrpgObjs.removeEventListenerById(self._e_event343);
        __o_rrpgObjs.removeEventListenerById(self._e_event342);
        __o_rrpgObjs.removeEventListenerById(self._e_event341);
        __o_rrpgObjs.removeEventListenerById(self._e_event340);
        __o_rrpgObjs.removeEventListenerById(self._e_event339);
        __o_rrpgObjs.removeEventListenerById(self._e_event338);
        __o_rrpgObjs.removeEventListenerById(self._e_event337);
        __o_rrpgObjs.removeEventListenerById(self._e_event336);
        __o_rrpgObjs.removeEventListenerById(self._e_event335);
        __o_rrpgObjs.removeEventListenerById(self._e_event334);
        __o_rrpgObjs.removeEventListenerById(self._e_event333);
        __o_rrpgObjs.removeEventListenerById(self._e_event332);
        __o_rrpgObjs.removeEventListenerById(self._e_event331);
        __o_rrpgObjs.removeEventListenerById(self._e_event330);
        __o_rrpgObjs.removeEventListenerById(self._e_event329);
        __o_rrpgObjs.removeEventListenerById(self._e_event328);
        __o_rrpgObjs.removeEventListenerById(self._e_event327);
        __o_rrpgObjs.removeEventListenerById(self._e_event326);
        __o_rrpgObjs.removeEventListenerById(self._e_event325);
        __o_rrpgObjs.removeEventListenerById(self._e_event324);
        __o_rrpgObjs.removeEventListenerById(self._e_event323);
        __o_rrpgObjs.removeEventListenerById(self._e_event322);
        __o_rrpgObjs.removeEventListenerById(self._e_event321);
        __o_rrpgObjs.removeEventListenerById(self._e_event320);
        __o_rrpgObjs.removeEventListenerById(self._e_event319);
        __o_rrpgObjs.removeEventListenerById(self._e_event318);
        __o_rrpgObjs.removeEventListenerById(self._e_event317);
        __o_rrpgObjs.removeEventListenerById(self._e_event316);
        __o_rrpgObjs.removeEventListenerById(self._e_event315);
        __o_rrpgObjs.removeEventListenerById(self._e_event314);
        __o_rrpgObjs.removeEventListenerById(self._e_event313);
        __o_rrpgObjs.removeEventListenerById(self._e_event312);
        __o_rrpgObjs.removeEventListenerById(self._e_event311);
        __o_rrpgObjs.removeEventListenerById(self._e_event310);
        __o_rrpgObjs.removeEventListenerById(self._e_event309);
        __o_rrpgObjs.removeEventListenerById(self._e_event308);
        __o_rrpgObjs.removeEventListenerById(self._e_event307);
        __o_rrpgObjs.removeEventListenerById(self._e_event306);
        __o_rrpgObjs.removeEventListenerById(self._e_event305);
        __o_rrpgObjs.removeEventListenerById(self._e_event304);
        __o_rrpgObjs.removeEventListenerById(self._e_event303);
        __o_rrpgObjs.removeEventListenerById(self._e_event302);
        __o_rrpgObjs.removeEventListenerById(self._e_event301);
        __o_rrpgObjs.removeEventListenerById(self._e_event300);
        __o_rrpgObjs.removeEventListenerById(self._e_event299);
        __o_rrpgObjs.removeEventListenerById(self._e_event298);
        __o_rrpgObjs.removeEventListenerById(self._e_event297);
        __o_rrpgObjs.removeEventListenerById(self._e_event296);
        __o_rrpgObjs.removeEventListenerById(self._e_event295);
        __o_rrpgObjs.removeEventListenerById(self._e_event294);
        __o_rrpgObjs.removeEventListenerById(self._e_event293);
        __o_rrpgObjs.removeEventListenerById(self._e_event292);
        __o_rrpgObjs.removeEventListenerById(self._e_event291);
        __o_rrpgObjs.removeEventListenerById(self._e_event290);
        __o_rrpgObjs.removeEventListenerById(self._e_event289);
        __o_rrpgObjs.removeEventListenerById(self._e_event288);
        __o_rrpgObjs.removeEventListenerById(self._e_event287);
        __o_rrpgObjs.removeEventListenerById(self._e_event286);
        __o_rrpgObjs.removeEventListenerById(self._e_event285);
        __o_rrpgObjs.removeEventListenerById(self._e_event284);
        __o_rrpgObjs.removeEventListenerById(self._e_event283);
        __o_rrpgObjs.removeEventListenerById(self._e_event282);
        __o_rrpgObjs.removeEventListenerById(self._e_event281);
        __o_rrpgObjs.removeEventListenerById(self._e_event280);
        __o_rrpgObjs.removeEventListenerById(self._e_event279);
        __o_rrpgObjs.removeEventListenerById(self._e_event278);
        __o_rrpgObjs.removeEventListenerById(self._e_event277);
        __o_rrpgObjs.removeEventListenerById(self._e_event276);
        __o_rrpgObjs.removeEventListenerById(self._e_event275);
        __o_rrpgObjs.removeEventListenerById(self._e_event274);
        __o_rrpgObjs.removeEventListenerById(self._e_event273);
        __o_rrpgObjs.removeEventListenerById(self._e_event272);
        __o_rrpgObjs.removeEventListenerById(self._e_event271);
        __o_rrpgObjs.removeEventListenerById(self._e_event270);
        __o_rrpgObjs.removeEventListenerById(self._e_event269);
        __o_rrpgObjs.removeEventListenerById(self._e_event268);
        __o_rrpgObjs.removeEventListenerById(self._e_event267);
        __o_rrpgObjs.removeEventListenerById(self._e_event266);
        __o_rrpgObjs.removeEventListenerById(self._e_event265);
        __o_rrpgObjs.removeEventListenerById(self._e_event264);
        __o_rrpgObjs.removeEventListenerById(self._e_event263);
        __o_rrpgObjs.removeEventListenerById(self._e_event262);
        __o_rrpgObjs.removeEventListenerById(self._e_event261);
        __o_rrpgObjs.removeEventListenerById(self._e_event260);
        __o_rrpgObjs.removeEventListenerById(self._e_event259);
        __o_rrpgObjs.removeEventListenerById(self._e_event258);
        __o_rrpgObjs.removeEventListenerById(self._e_event257);
        __o_rrpgObjs.removeEventListenerById(self._e_event256);
        __o_rrpgObjs.removeEventListenerById(self._e_event255);
        __o_rrpgObjs.removeEventListenerById(self._e_event254);
        __o_rrpgObjs.removeEventListenerById(self._e_event253);
        __o_rrpgObjs.removeEventListenerById(self._e_event252);
        __o_rrpgObjs.removeEventListenerById(self._e_event251);
        __o_rrpgObjs.removeEventListenerById(self._e_event250);
        __o_rrpgObjs.removeEventListenerById(self._e_event249);
        __o_rrpgObjs.removeEventListenerById(self._e_event248);
        __o_rrpgObjs.removeEventListenerById(self._e_event247);
        __o_rrpgObjs.removeEventListenerById(self._e_event246);
        __o_rrpgObjs.removeEventListenerById(self._e_event245);
        __o_rrpgObjs.removeEventListenerById(self._e_event244);
        __o_rrpgObjs.removeEventListenerById(self._e_event243);
        __o_rrpgObjs.removeEventListenerById(self._e_event242);
        __o_rrpgObjs.removeEventListenerById(self._e_event241);
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.button96 ~= nil then self.button96:destroy(); self.button96 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.button110 ~= nil then self.button110:destroy(); self.button110 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.button150 ~= nil then self.button150:destroy(); self.button150 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.button115 ~= nil then self.button115:destroy(); self.button115 = nil; end;
        if self.button140 ~= nil then self.button140:destroy(); self.button140 = nil; end;
        if self.rectangle138 ~= nil then self.rectangle138:destroy(); self.rectangle138 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit431 ~= nil then self.edit431:destroy(); self.edit431 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.button93 ~= nil then self.button93:destroy(); self.button93 = nil; end;
        if self.button135 ~= nil then self.button135:destroy(); self.button135 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit429 ~= nil then self.edit429:destroy(); self.edit429 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit442 ~= nil then self.edit442:destroy(); self.edit442 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.button122 ~= nil then self.button122:destroy(); self.button122 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit400 ~= nil then self.edit400:destroy(); self.edit400 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit404 ~= nil then self.edit404:destroy(); self.edit404 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.edit440 ~= nil then self.edit440:destroy(); self.edit440 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.button106 ~= nil then self.button106:destroy(); self.button106 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.button121 ~= nil then self.button121:destroy(); self.button121 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.button108 ~= nil then self.button108:destroy(); self.button108 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.edit419 ~= nil then self.edit419:destroy(); self.edit419 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.button118 ~= nil then self.button118:destroy(); self.button118 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.button162 ~= nil then self.button162:destroy(); self.button162 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.edit358 ~= nil then self.edit358:destroy(); self.edit358 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.button105 ~= nil then self.button105:destroy(); self.button105 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.edit390 ~= nil then self.edit390:destroy(); self.edit390 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.edit398 ~= nil then self.edit398:destroy(); self.edit398 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.edit389 ~= nil then self.edit389:destroy(); self.edit389 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.button99 ~= nil then self.button99:destroy(); self.button99 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.button145 ~= nil then self.button145:destroy(); self.button145 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.button109 ~= nil then self.button109:destroy(); self.button109 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.button153 ~= nil then self.button153:destroy(); self.button153 = nil; end;
        if self.edit439 ~= nil then self.edit439:destroy(); self.edit439 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.edit393 ~= nil then self.edit393:destroy(); self.edit393 = nil; end;
        if self.rectangle146 ~= nil then self.rectangle146:destroy(); self.rectangle146 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.button97 ~= nil then self.button97:destroy(); self.button97 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.button102 ~= nil then self.button102:destroy(); self.button102 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.button149 ~= nil then self.button149:destroy(); self.button149 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.edit416 ~= nil then self.edit416:destroy(); self.edit416 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.button134 ~= nil then self.button134:destroy(); self.button134 = nil; end;
        if self.button158 ~= nil then self.button158:destroy(); self.button158 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.rectangle137 ~= nil then self.rectangle137:destroy(); self.rectangle137 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit382 ~= nil then self.edit382:destroy(); self.edit382 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.edit397 ~= nil then self.edit397:destroy(); self.edit397 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.button148 ~= nil then self.button148:destroy(); self.button148 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.rectangle140 ~= nil then self.rectangle140:destroy(); self.rectangle140 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle147 ~= nil then self.rectangle147:destroy(); self.rectangle147 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button138 ~= nil then self.button138:destroy(); self.button138 = nil; end;
        if self.edit391 ~= nil then self.edit391:destroy(); self.edit391 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.edit402 ~= nil then self.edit402:destroy(); self.edit402 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.button152 ~= nil then self.button152:destroy(); self.button152 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.button128 ~= nil then self.button128:destroy(); self.button128 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.button120 ~= nil then self.button120:destroy(); self.button120 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.button141 ~= nil then self.button141:destroy(); self.button141 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.button155 ~= nil then self.button155:destroy(); self.button155 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.edit421 ~= nil then self.edit421:destroy(); self.edit421 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit428 ~= nil then self.edit428:destroy(); self.edit428 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.frmACN5 ~= nil then self.frmACN5:destroy(); self.frmACN5 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.frmACN2 ~= nil then self.frmACN2:destroy(); self.frmACN2 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.button104 ~= nil then self.button104:destroy(); self.button104 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.edit426 ~= nil then self.edit426:destroy(); self.edit426 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit384 ~= nil then self.edit384:destroy(); self.edit384 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.button126 ~= nil then self.button126:destroy(); self.button126 = nil; end;
        if self.button139 ~= nil then self.button139:destroy(); self.button139 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.button132 ~= nil then self.button132:destroy(); self.button132 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.button125 ~= nil then self.button125:destroy(); self.button125 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.button161 ~= nil then self.button161:destroy(); self.button161 = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.popOther ~= nil then self.popOther:destroy(); self.popOther = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit408 ~= nil then self.edit408:destroy(); self.edit408 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.button131 ~= nil then self.button131:destroy(); self.button131 = nil; end;
        if self.button127 ~= nil then self.button127:destroy(); self.button127 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.edit444 ~= nil then self.edit444:destroy(); self.edit444 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit403 ~= nil then self.edit403:destroy(); self.edit403 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.button163 ~= nil then self.button163:destroy(); self.button163 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.frmACN3 ~= nil then self.frmACN3:destroy(); self.frmACN3 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.edit399 ~= nil then self.edit399:destroy(); self.edit399 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit436 ~= nil then self.edit436:destroy(); self.edit436 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit395 ~= nil then self.edit395:destroy(); self.edit395 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.button123 ~= nil then self.button123:destroy(); self.button123 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.button142 ~= nil then self.button142:destroy(); self.button142 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.button116 ~= nil then self.button116:destroy(); self.button116 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.edit434 ~= nil then self.edit434:destroy(); self.edit434 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.edit394 ~= nil then self.edit394:destroy(); self.edit394 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit396 ~= nil then self.edit396:destroy(); self.edit396 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.rectangle144 ~= nil then self.rectangle144:destroy(); self.rectangle144 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.edit430 ~= nil then self.edit430:destroy(); self.edit430 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.button159 ~= nil then self.button159:destroy(); self.button159 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.button151 ~= nil then self.button151:destroy(); self.button151 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit386 ~= nil then self.edit386:destroy(); self.edit386 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.edit412 ~= nil then self.edit412:destroy(); self.edit412 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit413 ~= nil then self.edit413:destroy(); self.edit413 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.button146 ~= nil then self.button146:destroy(); self.button146 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.button133 ~= nil then self.button133:destroy(); self.button133 = nil; end;
        if self.edit423 ~= nil then self.edit423:destroy(); self.edit423 = nil; end;
        if self.rectangle143 ~= nil then self.rectangle143:destroy(); self.rectangle143 = nil; end;
        if self.edit441 ~= nil then self.edit441:destroy(); self.edit441 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.rclListaOutros ~= nil then self.rclListaOutros:destroy(); self.rclListaOutros = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.button107 ~= nil then self.button107:destroy(); self.button107 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.edit385 ~= nil then self.edit385:destroy(); self.edit385 = nil; end;
        if self.edit401 ~= nil then self.edit401:destroy(); self.edit401 = nil; end;
        if self.edit410 ~= nil then self.edit410:destroy(); self.edit410 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.rectangle145 ~= nil then self.rectangle145:destroy(); self.rectangle145 = nil; end;
        if self.edit420 ~= nil then self.edit420:destroy(); self.edit420 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.button160 ~= nil then self.button160:destroy(); self.button160 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.button98 ~= nil then self.button98:destroy(); self.button98 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.button111 ~= nil then self.button111:destroy(); self.button111 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.button92 ~= nil then self.button92:destroy(); self.button92 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit388 ~= nil then self.edit388:destroy(); self.edit388 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.button124 ~= nil then self.button124:destroy(); self.button124 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.edit435 ~= nil then self.edit435:destroy(); self.edit435 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.button147 ~= nil then self.button147:destroy(); self.button147 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.edit409 ~= nil then self.edit409:destroy(); self.edit409 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.edit424 ~= nil then self.edit424:destroy(); self.edit424 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.button91 ~= nil then self.button91:destroy(); self.button91 = nil; end;
        if self.edit415 ~= nil then self.edit415:destroy(); self.edit415 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.edit387 ~= nil then self.edit387:destroy(); self.edit387 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.button100 ~= nil then self.button100:destroy(); self.button100 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit418 ~= nil then self.edit418:destroy(); self.edit418 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.button94 ~= nil then self.button94:destroy(); self.button94 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button112 ~= nil then self.button112:destroy(); self.button112 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.button129 ~= nil then self.button129:destroy(); self.button129 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.frmACN4 ~= nil then self.frmACN4:destroy(); self.frmACN4 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.button154 ~= nil then self.button154:destroy(); self.button154 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.edit432 ~= nil then self.edit432:destroy(); self.edit432 = nil; end;
        if self.edit438 ~= nil then self.edit438:destroy(); self.edit438 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.frmACN1 ~= nil then self.frmACN1:destroy(); self.frmACN1 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.button137 ~= nil then self.button137:destroy(); self.button137 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button136 ~= nil then self.button136:destroy(); self.button136 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.edit411 ~= nil then self.edit411:destroy(); self.edit411 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button113 ~= nil then self.button113:destroy(); self.button113 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.edit422 ~= nil then self.edit422:destroy(); self.edit422 = nil; end;
        if self.button117 ~= nil then self.button117:destroy(); self.button117 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.rectangle141 ~= nil then self.rectangle141:destroy(); self.rectangle141 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.button130 ~= nil then self.button130:destroy(); self.button130 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.edit417 ~= nil then self.edit417:destroy(); self.edit417 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.rectangle142 ~= nil then self.rectangle142:destroy(); self.rectangle142 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.edit381 ~= nil then self.edit381:destroy(); self.edit381 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.edit437 ~= nil then self.edit437:destroy(); self.edit437 = nil; end;
        if self.edit443 ~= nil then self.edit443:destroy(); self.edit443 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.edit433 ~= nil then self.edit433:destroy(); self.edit433 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button119 ~= nil then self.button119:destroy(); self.button119 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit406 ~= nil then self.edit406:destroy(); self.edit406 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.button143 ~= nil then self.button143:destroy(); self.button143 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.button103 ~= nil then self.button103:destroy(); self.button103 = nil; end;
        if self.button101 ~= nil then self.button101:destroy(); self.button101 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.button144 ~= nil then self.button144:destroy(); self.button144 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.frmACN6 ~= nil then self.frmACN6:destroy(); self.frmACN6 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle136 ~= nil then self.rectangle136:destroy(); self.rectangle136 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.edit425 ~= nil then self.edit425:destroy(); self.edit425 = nil; end;
        if self.edit427 ~= nil then self.edit427:destroy(); self.edit427 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.edit414 ~= nil then self.edit414:destroy(); self.edit414 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.edit405 ~= nil then self.edit405:destroy(); self.edit405 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.button95 ~= nil then self.button95:destroy(); self.button95 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.edit383 ~= nil then self.edit383:destroy(); self.edit383 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.button157 ~= nil then self.button157:destroy(); self.button157 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.rectangle139 ~= nil then self.rectangle139:destroy(); self.rectangle139 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.button156 ~= nil then self.button156:destroy(); self.button156 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.edit392 ~= nil then self.edit392:destroy(); self.edit392 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.button114 ~= nil then self.button114:destroy(); self.button114 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit407 ~= nil then self.edit407:destroy(); self.edit407 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaACN()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaACN();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaACN = {
    newEditor = newfrmFichaACN, 
    new = newfrmFichaACN, 
    name = "frmFichaACN", 
    dataType = "Ambesek.Nefertyne.FichaACN", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha ACN", 
    description=""};

frmFichaACN = _frmFichaACN;
Firecast.registrarForm(_frmFichaACN);
Firecast.registrarDataType(_frmFichaACN);

return _frmFichaACN;
