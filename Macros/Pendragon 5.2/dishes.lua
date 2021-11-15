--                                                            
--                                                            
--                                                            
--                                                            
--                                                            
--                    /@@@              ,,                    
--                  @@@@@@        ,@@@@@&@@@@.                
--                @@@@@@@@      @@&   *&@&@@%@                
--             ,@@@ %@@@@&    @@@@      @@@@#                 
--           @@@(   @%@%&    @@@@      @@@@@&@@%&%.           
--                  @@@@@           %@@&/  ,@@@@@@@@          
--                 (@&&%@          ,          &@@@&(&         
--                 #@@@@&        ,@#@         ,&@@*@#         
--                 @@@@@&      @@@@           @@@@@%          
--                .@@@@@.     @@@@@,         @@@#             
--                @@@@%@     ,@@&&@@@@@@@@@&&(                
--                @@@@@@        @&@@@@@@.                     
--               @@@@@@@*&@                                   
--               %@@%@@@@&                                    
--              %@@@&@                                        
--
--
--
--
-- MACRO [PRATOS DE BANQUETES - PENDRAGON] RRPG8 by thirteen
-- Inicializando variáveis
local prato1 = 0;
local prato2 = 0;
local prato3 = 0;
local prato1n = "";
local prato2n = "";
local prato3n = "";	


	-- ROLAGEM
	local resultado, rolagem = rolar("3d20", "Rolagem de Pratos");
	local dados = {}; 
	
	-- COLETAR RESULTADOS
	for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       

        if op.tipo == "dado" then
                for j = 1, #op.resultados, 1 do
                        dados[#dados + 1] = op.resultados[j];
                end;
        end;
	end; 
	
	prato1 = dados[1];
	prato2 = dados[2];
	prato3 = dados[3];
	
		-- PRATOS
			-- PRIMEIRO PRATO
			if (prato1 == 1) then
			prato1n = "𝐶𝑎𝑟𝑛𝑒 𝑐𝑜𝑚 𝑚𝑜𝑠𝑡𝑎𝑟𝑑𝑎";
			
			elseif (prato1 == 2) then
			prato1n = "𝑄𝑢𝑖𝑐𝘩𝑒 𝑑𝑒 𝑐𝑒𝑟𝑣𝑒𝑗𝑎 𝑒 𝑞𝑢𝑒𝑖𝑗𝑜";
			
			elseif (prato1 == 3) then
			prato1n = "𝑃𝑢𝑑𝑖𝑚 𝑑𝑒 𝑝𝑒𝑠𝑐𝑜𝑐̧𝑜 𝑑𝑒 𝑐𝑖𝑠𝑛𝑒";
			
			elseif (prato1 == 4) then
			prato1n = "𝐵𝑜𝑙𝑖𝑛𝘩𝑜𝑠 𝑑𝑒 𝑡𝑢𝑡𝑎𝑛𝑜 𝑑𝑒 𝑏𝑜𝑖";
			
			elseif (prato1 == 5) then
			prato1n = "𝐸𝑛𝑔𝑢𝑖𝑎𝑠 𝑒𝑚 𝑝𝑢𝑟𝑒̂ 𝑒𝑠𝑝𝑒𝑠𝑠𝑜 𝑑𝑒 𝑒𝑠𝑝𝑒𝑐𝑖𝑎𝑟𝑖𝑎𝑠";
			
			elseif (prato1 == 6) then
			prato1n = "𝐶𝑖𝑠𝑛𝑒 𝑓𝑖𝑙𝘩𝑜𝑡𝑒 𝑎𝑠𝑠𝑎𝑑𝑜";
			
			elseif (prato1 == 7) then
			prato1n = "𝐶𝑎𝑝𝑎̃𝑜 𝑔𝑜𝑟𝑑𝑜";
			
			elseif (prato1 == 8) then
			prato1n = "𝐺𝑎𝑟𝑐̧𝑎 𝑎𝑠𝑠𝑎𝑑𝑎";
			
			elseif (prato1 == 9) then
			prato1n = "𝐹𝑎𝑖𝑠𝑎̃𝑜 𝑎𝑠𝑠𝑎𝑑𝑜";
			
			elseif (prato1 == 10) then
			prato1n = "𝐵𝑜𝑡𝑖𝑎 𝑒𝑚 𝑚𝑜𝑙𝘩𝑜 𝑣𝑒𝑟𝑑𝑒 𝑓𝑟𝑖𝑜";
			
			elseif (prato1 == 11) then
			prato1n = "𝑇𝑜𝑟𝑡𝑎𝑠 𝑑𝑒 𝑓𝑟𝑢𝑡𝑎𝑠";
			
			elseif (prato1 == 12) then
			prato1n = "𝐹𝑎𝑡𝑖𝑎𝑠 𝑑𝑒 𝑐𝑎𝑟𝑛𝑒 𝑓𝑟𝑖𝑎 𝑒𝑚 𝑚𝑜𝑙𝘩𝑜 𝑑𝑒 𝑔𝑒𝑛𝑔𝑖𝑏𝑟𝑒";
			
			elseif (prato1 == 13) then
			prato1n = "𝐶𝑟𝑒𝑚𝑒 𝑐𝑜𝑚 𝑓𝑟𝑢𝑡𝑎𝑠 𝑠𝑒𝑐𝑎𝑠";
			
			elseif (prato1 == 14) then
			prato1n = "𝑇𝑜𝑛𝑖𝑛𝘩𝑎 𝑒 𝑒𝑟𝑣𝑖𝑙𝘩𝑎𝑠";
			
			elseif (prato1 == 15) then
			prato1n = "𝑃𝑎̃𝑜 𝑑𝑒 𝑠𝑎𝑙𝑠𝑎";
			
			elseif (prato1 == 16) then
			prato1n = "𝑅𝑜𝑙𝑜 𝑑𝑒 𝑐𝑎𝑟𝑛𝑒 𝑑𝑒 𝑝𝑜𝑟𝑐𝑜 𝑐𝑜𝑚 𝑒𝑟𝑣𝑎𝑠";
			
			elseif (prato1 == 17) then
			prato1n = "𝑆𝑎𝑙𝑚𝑎̃𝑜 𝑎𝑠𝑠𝑎𝑑𝑜 𝑒𝑚 𝑚𝑜𝑙𝘩𝑜 𝑑𝑒 𝑣𝑖𝑛𝘩𝑜";
			
			elseif (prato1 == 18) then
			prato1n = "𝑂𝑚𝑒𝑙𝑒𝑡𝑒 𝑑𝑒 𝑎𝑚𝑒̂𝑛𝑑𝑜𝑎𝑠";
			
			elseif (prato1 == 19) then
			prato1n = "𝑅𝑎𝑏𝑜𝑠 𝑑𝑒 𝑏𝑎𝑐𝑎𝑙𝘩𝑎𝑢";
			
			elseif (prato1 == 20) then
			prato1n = "𝐶𝑜𝑛𝑓𝑒𝑖𝑡𝑜𝑠 (𝑎𝑚𝑒𝑖𝑥𝑎, 𝑚𝑎𝑟𝑚𝑒𝑙𝑜 𝑒 𝑚𝑎𝑐̧𝑎̃)";
			end;
			
			
			-- SEGUNDO PRATO
			if (prato2 == 1) then
			prato2n = "𝐴𝑙𝑐𝑎𝑐𝘩𝑜𝑓𝑟𝑎𝑠 𝑟𝑒𝑐𝘩𝑒𝑎𝑑𝑎𝑠 𝑐𝑜𝑚 𝑎𝑟𝑟𝑜𝑧 𝑑𝑒 𝑚𝑖𝑟𝑡𝑖𝑙𝑜";
			
			elseif (prato2 == 2) then
			prato2n = "𝐶𝑎𝑙𝑑𝑜 𝑐𝑜𝑚 𝑏𝑎𝑐𝑜𝑛 𝑒 𝑒𝑟𝑣𝑖𝑙𝘩𝑎𝑠";
			
			elseif (prato2 == 3) then
			prato2n = "𝐿𝑎𝑑𝑟𝑖𝑙𝘩𝑜𝑠 𝑑𝑒 𝑐𝑎𝑟𝑛𝑒";
			
			elseif (prato2 == 4) then
			prato2n = "𝐹𝑜𝑐𝑎 𝑎𝑠𝑠𝑎𝑑𝑎";
			
			elseif (prato2 == 5) then
			prato2n = "𝐹𝑟𝑎𝑛𝑔𝑜 𝑎𝑠𝑠𝑎𝑑𝑜 𝑐𝑜𝑚 𝑚𝑒𝑙, 𝑒𝑛𝑟𝑜𝑙𝑎𝑑𝑜 𝑐𝑜𝑚 𝑚𝑜𝑠𝑡𝑎𝑟𝑑𝑎 𝑒 𝑝𝑖𝑛𝘩𝑜̃𝑒𝑠";
			
			elseif (prato2 == 6) then
			prato2n = "𝐵𝑟𝑎𝑠𝑎̃𝑜 𝑒𝑚 𝑔𝑒𝑙𝑒𝑖𝑎 𝑑𝑒 𝑐𝑎𝑟𝑛𝑒";
			
			elseif (prato2 == 7) then
			prato2n = "𝐽𝑎𝑣𝑎𝑙𝑖 𝑟𝑒𝑐𝘩𝑒𝑎𝑑𝑜";
			
			elseif (prato2 == 8) then
			prato2n = "𝑃𝑎𝑣𝑎̃𝑜 (𝑟𝑒𝑐𝑜𝑏𝑒𝑟𝑡𝑜 𝑐𝑜𝑚 𝑠𝑢𝑎𝑠 𝑝𝑒𝑛𝑎𝑠 𝑎𝑛𝑡𝑒𝑠 𝑑𝑜 𝑠𝑒𝑟𝑣𝑖𝑟)";
			
			elseif (prato2 == 9) then
			prato2n = "𝐵𝑜𝑙𝑜𝑠 𝑑𝑒 𝑒𝑟𝑣𝑎𝑠 𝑑𝑒 𝑡𝑒𝑚𝑝𝑒𝑟𝑎𝑚𝑒𝑛𝑡𝑜 𝑎𝑠𝑡𝑟𝑜𝑙𝑜𝑔𝑖𝑐𝑜 𝑒 𝑞𝑢𝑒𝑖𝑗𝑜";
			
			elseif (prato2 == 10) then
			prato2n = "𝑃𝑎𝑠𝑡𝑒𝑖𝑠 𝑑𝑒 𝑐𝑎𝑝𝑎̃𝑜 𝑒 𝑏𝑎𝑡𝑎𝑡𝑎𝑠 𝑓𝑟𝑖𝑡𝑎𝑠";
			
			elseif (prato2 == 11) then
			prato2n = "𝐺𝑟𝑢𝑎 𝑎𝑠𝑠𝑎𝑑𝑎";
			
			elseif (prato2 == 12) then
			prato2n = "𝐶𝑜𝑒𝑙𝘩𝑜 𝑎𝑠𝑠𝑎𝑑𝑜";
			
			elseif (prato2 == 13) then
			prato2n = "𝑃𝑎𝑠𝑡𝑒𝑖𝑠 𝑑𝑒 𝑠𝑎𝑟𝑔𝑎 𝑒 𝑒𝑛𝑔𝑢𝑖𝑎";
			
			elseif (prato2 == 14) then
			prato2n = "𝐴𝑏𝑒𝑡𝑜𝑢𝑟𝑜 𝑓𝑒𝑟𝑣𝑖𝑑𝑜";
			
			elseif (prato2 == 15) then
			prato2n = "𝐶𝑟𝑒𝑚𝑒 𝑑𝑒 𝑡𝑟𝑖𝑔𝑜 𝑐𝑜𝑧𝑖𝑑𝑜";
			
			elseif (prato2 == 16) then
			prato2n = "𝐹𝑟𝑎𝑛𝑔𝑎𝑠 (𝑠𝑒𝑚𝑒𝑙𝘩𝑎𝑛𝑡𝑒 𝑎̀ 𝐺𝑎𝑙𝑖𝑛𝘩𝑎𝑠 𝑑𝑒 𝑐𝑎𝑐̧𝑎 𝑑𝑎 𝐶𝑜𝑟𝑛𝑢𝑎𝑙𝘩𝑎)";
			
			elseif (prato2 == 17) then
			prato2n = "𝐶𝑎𝑢𝑑𝑎𝑠 𝑑𝑒 𝐶𝑎𝑠𝑡𝑜𝑟";
			
			elseif (prato2 == 18) then
			prato2n = "𝐶𝑜𝑐𝑘𝑒𝑛𝑡𝑟𝑖𝑐𝑒";
			
			elseif (prato2 == 19) then
			prato2n = "𝐿𝑎𝑚𝑝𝑟𝑒𝑖𝑎𝑠 𝑎𝑜 𝑚𝑜𝑙𝘩𝑜 𝑝𝑖𝑐𝑎𝑛𝑡𝑒";
			
			elseif (prato2 == 20) then
			prato2n = "𝑇𝑜𝑟𝑡𝑎 𝑑𝑒 𝑓𝑟𝑢𝑡𝑎𝑠 𝑒 𝑠𝑎𝑙𝑚𝑎̃𝑜";
			end;
			
			
			-- TERCEIRO PRATO
			if (prato3 == 1) then
			prato3n = "𝐵𝑜𝑙𝑖𝑛𝘩𝑜𝑠 𝑑𝑒 𝑒𝑟𝑣𝑎𝑠";
			
			elseif (prato3 == 2) then
			prato3n = "𝐴𝑠𝑎𝑠 𝑑𝑒 𝑓𝑟𝑎𝑛𝑔𝑜 𝑒 𝑓𝑎𝑖𝑠𝑎̃𝑜 𝑎𝑠𝑠𝑎𝑑𝑎𝑠";
			
			elseif (prato3 == 3) then
			prato3n = "𝑆𝑒𝑙𝑒𝑐̧𝑎̃𝑜 𝑑𝑒 𝑞𝑢𝑒𝑖𝑗𝑜𝑠";
			
			elseif (prato3 == 4) then
			prato3n = "𝑀𝑎𝑟𝑚𝑒𝑙𝑜𝑠 𝑐𝑜𝑧𝑖𝑑𝑜𝑠 𝑒𝑚 𝑣𝑖𝑛𝘩𝑜";
			
			elseif (prato3 == 5) then
			prato3n = "𝑃𝑜𝑚𝑏𝑜 𝑎𝑠𝑠𝑎𝑑𝑜";
			
			elseif (prato3 == 6) then
			prato3n = "𝐵𝑜𝑙𝑜𝑠 𝑑𝑒 𝑠𝑎𝑏𝑢𝑔𝑢𝑒𝑖𝑟𝑜 𝑑𝑒 𝑎𝑑𝑖𝑣𝑖𝑛𝘩𝑎𝑐̧𝑎̃𝑜";
			
			elseif (prato3 == 7) then
			prato3n = "𝐶𝑜𝑡𝑜𝑣𝑖𝑎𝑠 𝑎𝑠𝑠𝑎𝑑𝑎𝑠";
			
			elseif (prato3 == 8) then
			prato3n = "𝑉𝑒𝑎𝑑𝑜 𝑒𝑚 𝑐𝑟𝑒𝑚𝑒 𝑑𝑒 𝑡𝑟𝑖𝑔𝑜 𝑐𝑜𝑧𝑖𝑑𝑜";
			
			elseif (prato3 == 9) then
			prato3n = "𝐶𝑎𝑟𝑛𝑒 𝑑𝑒 𝑓𝑟𝑎𝑛𝑔𝑜 𝑏𝑟𝑎𝑛𝑐𝑎 𝑐𝑜𝑧𝑖𝑑𝑎 𝑒𝑚 𝑣𝑖𝑛𝘩𝑜";
			
			elseif (prato3 == 10) then
			prato3n = "𝐵𝑜𝑙𝑖𝑛𝘩𝑜𝑠 𝑑𝑒 𝑎𝑚𝑒̂𝑛𝑑𝑜𝑎 𝑠𝑒𝑟𝑣𝑖𝑑𝑜𝑠 𝑒𝑚 𝑟𝑜𝑑𝑒𝑙𝑎𝑠";
			
			elseif (prato3 == 11) then
			prato3n = "𝑂𝑣𝑜𝑠 𝑔𝑙𝑎𝑐𝑒𝑎𝑑𝑜𝑠";
			
			elseif (prato3 == 12) then
			prato3n = "𝐹𝑟𝑢𝑡𝑎𝑠 𝑖𝑚𝑝𝑜𝑟𝑡𝑎𝑑𝑎𝑠 𝑜𝑢 𝑎𝑠𝑠𝑎𝑑𝑎𝑠";
			
			elseif (prato3 == 13) then
			prato3n = "𝐷𝑜𝑢𝑐𝑒𝑡𝑡𝑒 (𝑡𝑜𝑟𝑡𝑎 𝑑𝑒 𝑐𝑟𝑒𝑚𝑒 𝑒 𝑡𝑢𝑡𝑎𝑛𝑜)";
			
			elseif (prato3 == 14) then
			prato3n = "𝐴𝑔𝑢𝑖𝑎 𝑎𝑠𝑠𝑎𝑑𝑎";
			
			elseif (prato3 == 15) then
			prato3n = "𝐵𝑟𝑒𝑚𝑎 𝑎𝑠𝑠𝑎𝑑𝑎 𝑠𝑒𝑟𝑣𝑖𝑑𝑎 𝑒𝑚 𝑝𝑜𝑡𝑒 𝑑𝑒 𝑚𝑎𝑠𝑠𝑎";
			
			elseif (prato3 == 16) then
			prato3n = "𝑁𝑎𝑏𝑜𝑠 𝑎𝑠𝑠𝑎𝑑𝑜𝑠 𝑐𝑜𝑚 𝑞𝑢𝑒𝑖𝑗𝑜";
			
			elseif (prato3 == 17) then
			prato3n = "𝐻𝑖𝑝𝑝𝑜𝑐𝑟𝑎𝑠 (𝑣𝑖𝑛𝘩𝑜 𝑎𝑟𝑜𝑚𝑎𝑡𝑖𝑧𝑎𝑑𝑜 𝑐𝑜𝑚 𝑒𝑠𝑝𝑒𝑐𝑖𝑎𝑟𝑖𝑎𝑠)";
			
			elseif (prato3 == 18) then
			prato3n = "𝑇𝑜𝑟𝑡𝑎𝑠 𝑑𝑒 𝑐𝑜𝑔𝑢𝑚𝑒𝑙𝑜𝑠";
			
			elseif (prato3 == 19) then
			prato3n = "𝑊𝑎𝑓𝑒𝑟𝑠";
			
			elseif (prato3 == 20) then
			prato3n = "𝐸𝑠𝑝𝑒𝑐𝑖𝑎𝑟𝑖𝑎𝑠 𝑖𝑛𝑡𝑒𝑖𝑟𝑎𝑠 𝑒 𝑠𝑒𝑐𝑎𝑠 “𝑝𝑎𝑟𝑎 𝑎𝑗𝑢𝑑𝑎𝑟 𝑛𝑎 𝑑𝑖𝑔𝑒𝑠𝑡𝑎̃𝑜”";
			end;


-- RESULTADO
enviar("⠀\n[§K14]	┏━━━━━━━━━━━━━━━━━━━━━━━━━━༻❁༺━━━━━━━━━━━━━━━━━━━━━━━━━━┓⠀\n[§K14]‎")
enviar("## [§K14]	🙞 [§K1]𝕻𝖗𝖆𝖙𝖔𝖘 𝖉𝖔 𝕭𝖆𝖓𝖖𝖚𝖊𝖙𝖊 [§K14]🙜\n[§K1]	𝕻𝖗𝖎𝖒𝖊𝖎𝖗𝖔 𝕻𝖗𝖆𝖙𝖔\n	[§K14]🙚 ".. prato1n .." 🙘\n \n[§K15]	━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ✠ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━\n‎\n[§K1]	[§K1]𝕾𝖊𝖌𝖚𝖓𝖉𝖔 𝕻𝖗𝖆𝖙𝖔\n	[§K14]🙚 ".. prato2n .." 🙘\n \n[§K15]	━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ✠ ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━\n‎\n[§K1]	[§K1]𝕿𝖊𝖗𝖈𝖊𝖎𝖗𝖔 𝕻𝖗𝖆𝖙𝖔\n	[§K14]🙚 ".. prato3n .." 🙘\n‎\n[§K14]	┗━━━━━━━━━━━━━━━━━━━━━━━━━━༻❁༺━━━━━━━━━━━━━━━━━━━━━━━━━━┛‎\n⠀");