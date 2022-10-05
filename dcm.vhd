--
-- TeC7 VHDL Source Code
--    Tokuyama kousen Educational Computer Ver.7
--
-- Copyright (C) 2002-2021 by
--                      Dept. of Computer Science and Electronic Engineering,
--                      Tokuyama College of Technology, JAPAN
--
--   上記著作権者は，Free Software Foundation によって公開されている GNU 一般公
-- 衆利用許諾契約書バージョン２に記述されている条件を満たす場合に限り，本ソース
-- コード(本ソースコードを改変したものを含む．以下同様)を使用・複製・改変・再配
-- 布することを無償で許諾する．
--
--   本ソースコードは＊全くの無保証＊で提供されるものである。上記著作権者および
-- 関連機関・個人は本ソースコードに関して，その適用可能性も含めて，いかなる保証
-- も行わない．また，本ソースコードの利用により直接的または間接的に生じたいかな
-- る損害に関しても，その責任を負わない．
--
--
-- dcm.vhd : クロック生成
--
-- 2021.11.20 : 90度遅れの49.152MHzを廃止
-- 2019.08.27 : 新規作成
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

entity DCM is
    Port ( P_CLK_IN      : in    std_logic;  -- 9.8304MHz
           P_49_152MHz   : out   std_logic;
           P_2_4576MHz   : out   std_logic;
           P_LOCKED      : out   std_logic
         );
end DCM;

architecture Behavioral of DCM is
  
  component pll
    port ( inclk0		: IN STD_LOGIC  := '0';
		     c0		: OUT STD_LOGIC ;
		     c1		: OUT STD_LOGIC ;
		     locked		: OUT STD_LOGIC 
	      );
  end component;
  
begin
  pll1 : pll
    port map ( inclk0  => P_CLK_IN,
               c0 => P_49_152MHz,
					c1 => P_2_4576MHz,
               locked   => P_LOCKED
             );
				 
end Behavioral;
