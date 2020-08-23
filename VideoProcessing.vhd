
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;
use ieee.std_logic_unsigned.all;

entity VideoProcessing is
    Port ( vid_data : in STD_LOGIC_VECTOR (23 downto 0);
           pHSync : in STD_LOGIC;
           pVSync : in STD_LOGIC;
           pVDE : in STD_LOGIC;
           clk_pix: in STD_LOGIC;
           sliders: in STD_LOGIC_VECTOR(3 downto 0);
           buttons: in STD_LOGIC_VECTOR(3 downto 0);
           OUT_vid_data : out STD_LOGIC_VECTOR (23 downto 0);
           OUT_pHSync : out STD_LOGIC;
           OUT_pVSync : out STD_LOGIC;
           OUT_pVDE : out STD_LOGIC;
           OUT_clk_pix: out STD_LOGIC;
           leds: out STD_LOGIC_VECTOR(3 downto 0)
           );
end VideoProcessing;

architecture Behavioral of VideoProcessing is
 
signal gray: std_logic_vector(7 downto 0);

signal x:integer;
signal y:integer;
signal z: integer;
signal a:integer;

begin
x<=conv_integer(vid_data(23 downto 16));
y<=conv_integer(vid_data(15 downto 8));
z<=conv_integer(vid_data(7 downto 0));
a<=(x+y+z)/3;
gray <= conv_std_logic_vector(a,8);
    --video signals
OUT_vid_data(23 downto 16) <= gray;
OUT_vid_data(15 downto 8) <= gray;
OUT_vid_data(7 downto 0) <= gray;
  
  
OUT_pHSync <=  pHSync;
OUT_pVSync <= pVSync;
OUT_pVDE <= pVDE;

end Behavioral;
