`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2020 23:28:16
// Design Name: 
// Module Name: GameUI
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Got to implement center push button 
//Got to implement falling ball 
//implement point system 
module GameUI(input baysysclk,input myClock,input left_button_result, input right_button_result, input center_button_result, input [12:0]pixel_index, output reg [15:0]oled_data, output reg [3:0]anode_seg_output, output reg [6:0]led_seg_output);

reg [7:0]x_coordinate = 0;
reg [6:0]y_coordinate = 0;
reg [3:0]points_counter = 0;

reg [7:0] var1 = 0; //horizontal dynamics variable 1
reg [7:0] var2 = 0; //horizontal dynamics variable 2
reg [6:0] var3 = 0; //vertical dynamics variable 1

reg [13:0] counter = 0;
reg [15:0] counter2 = 0;
reg [13:0] counter3 = 0;
reg [14:0] counter4 = 0;

reg left_button_output;
reg right_button_output = 0;
reg center_button_output = 0;

reg flag = 0;
reg release_flag = 0;


always @(posedge myClock)
begin
    y_coordinate = pixel_index/96;
    x_coordinate = pixel_index%96;
    
    if( y_coordinate >=0 && y_coordinate < 41) 
        oled_data = 16'h5FFD; // blue color
    
    else
        oled_data = 16'h1620;    // green color
        
    if(y_coordinate == 1)
    begin
        if(x_coordinate == 3 || x_coordinate == 6 )
            oled_data = 16'hFE81; // yellow color 
    end 
    
    if(y_coordinate == 2)
    begin
        if(x_coordinate == 8)
            oled_data =  16'hFE81;
            
        if(x_coordinate >= 22 && x_coordinate <= 24)
            oled_data = 16'hFFFF;
    end 
    
    if(y_coordinate == 3)
    begin 
        if(x_coordinate == 1)
            oled_data = 16'hFE81; // yellow color
            
        if(x_coordinate >=4 && x_coordinate <=6)
            oled_data = 16'hFE81; // yellow color
            
        if(x_coordinate >= 21 && x_coordinate <= 27) 
            oled_data = 16'hFFFF; // White color      
    end
    
    if(y_coordinate == 4)
    begin 
        if(x_coordinate >= 3 && x_coordinate <= 7)
            oled_data = 16'hFE81; // YELLOW COLOUR
        
        if(x_coordinate == 10)
            oled_data = 16'hFE81; // yellow color
                
        if(x_coordinate >= 18 && x_coordinate <= 30)
            oled_data = 16'hFFFF; //White colour 
        
        if(x_coordinate >= 75 && x_coordinate <= 77)
            oled_data = 16'hFFFF; // White color    
    end 
    
    if(y_coordinate == 5)
    begin
        if(x_coordinate >=2 && x_coordinate <= 8)
            oled_data = 16'hFE81; // yellow color
            
        if(x_coordinate >= 17 && x_coordinate <= 31)
            oled_data = 16'hFFFF; //white color
            
        if(x_coordinate >= 45 && x_coordinate <= 49)
                oled_data = 16'hFFFF; //white color 
            
        if(x_coordinate >= 73 && x_coordinate <= 81)
                    oled_data = 16'hFFFF; //white color                
    end 
    
    if(y_coordinate == 6)
    begin
        if(x_coordinate == 0)
            oled_data = 16'hFE81; //yellow color
            
        if(x_coordinate >=2 && x_coordinate <= 8)
            oled_data = 16'hFE81; // yellow color
            
        if(x_coordinate == 10)
            oled_data = 16'hFE81; // yellow color
        
        if(x_coordinate >=14 && x_coordinate <= 32)
            oled_data = 16'hFFFF;  //white color

        if(x_coordinate >= 44 && x_coordinate <= 52)
            oled_data = 16'hFFFF; //white color    
            
        if(x_coordinate >= 72 && x_coordinate <= 82)
                oled_data = 16'hFFFF; //white color          
    end
    
    if(y_coordinate == 7)
    begin
        if(x_coordinate >=2 && x_coordinate <= 8)
            oled_data = 16'hFE81; // yellow color
            
        if(x_coordinate >= 14 && x_coordinate <= 33)
                oled_data = 16'hFFFF; //white color

        if(x_coordinate >= 42 && x_coordinate <= 53)
            oled_data = 16'hFFFF; //white color     

        if(x_coordinate >= 69 && x_coordinate <= 83)
            oled_data = 16'hFFFF; //white color                                   
    end
    
    if(y_coordinate == 8)
    begin
        if(x_coordinate >= 3 && x_coordinate <= 7)
            oled_data = 16'hFE81; // YELLOW COLOR
        
        if(x_coordinate == 10)
            oled_data = 16'hFE81; // Yellow color
      
        if(x_coordinate >= 14 && x_coordinate <= 33)
            oled_data = 16'hFFFF; //white color
        
        if(x_coordinate >= 39 && x_coordinate <= 56)
                oled_data = 16'hFFFF; //white color
                
        if(x_coordinate >= 68 && x_coordinate <= 84)
                oled_data = 16'hFFFF; //white color    
    end 
    
    if(y_coordinate == 9)
    begin
        if(x_coordinate == 1)
            oled_data = 16'hFE81; //Yellow color\
        
        if(x_coordinate >=4 && x_coordinate <= 6)
            oled_data = 16'hFE81; //Yellow color
            
        if(x_coordinate >= 16 && x_coordinate <= 31)
                oled_data = 16'hFFFF; //white color
        
        if(x_coordinate >= 37 && x_coordinate <= 57)
                    oled_data = 16'hFFFF; //white color

        if(x_coordinate >= 70 && x_coordinate <= 86)
            oled_data = 16'hFFFF; //white color 
    end
    
    if(y_coordinate == 10)
    begin
        if(x_coordinate == 9)
            oled_data = 16'hFE81; //yellow color
            
        if(x_coordinate >= 18 && x_coordinate <= 30)
                oled_data = 16'hFFFF; //white color
                
        if(x_coordinate >= 37 && x_coordinate <= 58)
                    oled_data = 16'hFFFF; //white color
                    
        if(x_coordinate >= 70 && x_coordinate <= 86)
                        oled_data = 16'hFFFF; //white color                    
    end
    
    if(y_coordinate == 11)
    begin
        if(x_coordinate == 3 || x_coordinate == 7)
            oled_data = 16'hFE81;
        
        if(x_coordinate >= 18 && x_coordinate <= 28)
                oled_data = 16'hFFFF; //white color

        if(x_coordinate >= 39 && x_coordinate <= 59)
            oled_data = 16'hFFFF; //white color
       
        if(x_coordinate >= 71 && x_coordinate <= 85)
                oled_data = 16'hFFFF; //white color    
    end
    
    if(y_coordinate == 12)
    begin
        if(x_coordinate == 5)
            oled_data = 16'hFE81;
        
        if(x_coordinate >= 21 && x_coordinate <= 27)
                oled_data = 16'hFFFF; //white color
                
        if(x_coordinate >= 40 && x_coordinate <= 55)
                    oled_data = 16'hFFFF; //white color
        
        if(x_coordinate >= 74 && x_coordinate <= 84)
                        oled_data = 16'hFFFF; //white color                                                
    end 
    
    if(y_coordinate == 13)
    begin 
        if(x_coordinate >= 23  && x_coordinate <= 26)
        oled_data = 16'hFFFF; //white color
        
        if(x_coordinate >= 43 && x_coordinate <= 52)
            oled_data = 16'hFFFF; //white color

        if(x_coordinate >= 74 && x_coordinate <= 79)
            oled_data = 16'hFFFF; //white color     
                                                       
    end
    
    if(y_coordinate == 14)
    begin
        if(x_coordinate >= 44 && x_coordinate <= 45)
            oled_data = 16'hFFFF; // WHITE COLOR

        if(x_coordinate >= 48 && x_coordinate <= 50)
            oled_data = 16'hFFFF; //white color
        
        if(x_coordinate>= 56 && x_coordinate <= 60)
            oled_data = 16'd0; //black colour    
    end 
    
    // new  code insertions for the background
    if(y_coordinate == 15)
    begin
        if(x_coordinate >= 55 && x_coordinate <= 56)
            oled_data = 16'd0; // black 
            
        if(x_coordinate >= 57 && x_coordinate <= 60)
            oled_data = 16'hFFFF; // white 

        if(x_coordinate >= 61 && x_coordinate <= 62)
            oled_data = 16'd0; // black             
               
        if(x_coordinate >= 70 && x_coordinate <= 71)
                oled_data = 16'd0; // black                
    end

    if(y_coordinate == 16)
    begin
        if(x_coordinate >= 54 && x_coordinate <= 55)
            oled_data = 16'd0; // black
            
        if(x_coordinate >=56 && x_coordinate <= 61)
            oled_data = 16'hFFFF; // white 
        
        if(x_coordinate == 62)
            oled_data = 16'd0; // black
            
        if(x_coordinate >= 69 && x_coordinate <= 70)
            oled_data = 16'd0;         // black
            
        if(x_coordinate == 72)
            oled_data = 16'd0; // black
                
    end
    
    if(y_coordinate == 17)
    begin
        if((x_coordinate >= 39 && x_coordinate <= 42) || x_coordinate == 53 || x_coordinate == 54 || x_coordinate == 63 || x_coordinate == 64 || (x_coordinate >= 68 && x_coordinate <= 69) || (x_coordinate>=72 && x_coordinate <= 73)) 
            oled_data = 16'd0; //black
            
         if((x_coordinate >= 55 && x_coordinate <= 62) || x_coordinate == 70 || x_coordinate === 71)
            oled_data = 16'hFFFF;   //white 
    end
    
    if(y_coordinate == 18)
    begin
        if((x_coordinate >= 37 && x_coordinate <= 39) || (x_coordinate >= 42 && x_coordinate <= 43) || (x_coordinate >= 51 && x_coordinate <= 53) || x_coordinate == 65 || x_coordinate == 67 || x_coordinate == 68 || x_coordinate == 73 || x_coordinate == 74)
            oled_data = 16'd0; //black
        
        if(x_coordinate == 40 || x_coordinate == 41 || (x_coordinate >= 54 && x_coordinate <= 64) || (x_coordinate >= 69 && x_coordinate <= 72))     
            oled_data = 16'hFFFF; //white
    end
    
    if(y_coordinate == 19)
    begin
        if(x_coordinate == 36 || x_coordinate == 37 || x_coordinate == 43 || x_coordinate == 44 || x_coordinate == 50 || x_coordinate == 51 || (x_coordinate >= 65 && x_coordinate <= 67) || x_coordinate == 74 || x_coordinate == 75 ||(x_coordinate >= 88 && x_coordinate <= 90))
            oled_data = 16'd0; //black
            
        if((x_coordinate >= 38 && x_coordinate <= 42) || (x_coordinate >= 52 && x_coordinate <= 64) || (x_coordinate >= 68 && x_coordinate <= 73))
            oled_data = 16'hFFFF; //white 
    end
    
    if(y_coordinate == 20)
    begin
        if((x_coordinate >= 15 && x_coordinate <= 18) || x_coordinate == 35 || x_coordinate == 36 || x_coordinate == 44 || x_coordinate == 49 || x_coordinate == 50 || x_coordinate == 66 || x_coordinate == 67 || x_coordinate == 75 || x_coordinate == 76 || x_coordinate == 87 || x_coordinate == 88 || x_coordinate == 91 || x_coordinate == 92)
            oled_data = 16'd0; //black
        
        if((x_coordinate >= 37 && x_coordinate <= 43) || (x_coordinate >= 51 && x_coordinate <= 65) || (x_coordinate >= 68 && x_coordinate <= 74) || x_coordinate == 89 || x_coordinate == 90)     
            oled_data = 16'hFFFF;//white
    end
    
    if(y_coordinate == 21)
    begin
        if((x_coordinate >= 13 && x_coordinate <= 15) || x_coordinate == 19 || (x_coordinate >= 29 && x_coordinate <= 32) || x_coordinate == 35 || x_coordinate == 45 || x_coordinate == 48 || x_coordinate == 49 || x_coordinate == 66 || x_coordinate == 76 ||(x_coordinate >= 85 && x_coordinate <= 87 ) || x_coordinate == 93)
            oled_data = 16'd0; //black
            
        if((x_coordinate >= 16 && x_coordinate <= 18) || (x_coordinate >= 36 && x_coordinate <= 44) || (x_coordinate >= 50 && x_coordinate <= 65) || (x_coordinate >= 67 && x_coordinate <= 75) || (x_coordinate >= 88 && x_coordinate <= 92))
            oled_data = 16'hFFFF; //white
    end
    
    if(y_coordinate == 22)
    begin 
        if(x_coordinate == 12 || x_coordinate == 13 || x_coordinate == 20 || x_coordinate == 28 || x_coordinate == 32 || x_coordinate == 33 || x_coordinate == 34 || x_coordinate == 45 || x_coordinate == 46 || x_coordinate == 47 || x_coordinate == 66 || x_coordinate == 77 || x_coordinate == 78 || x_coordinate == 83 || x_coordinate == 84 || x_coordinate == 94)
            oled_data =  16'd0; //black
        
        if((x_coordinate >= 14 && x_coordinate <= 19)|| (x_coordinate>= 29 && x_coordinate <= 31)||(x_coordinate >= 35 && x_coordinate <= 44) || (x_coordinate >= 48 && x_coordinate <= 65) || (x_coordinate >= 67 && x_coordinate <= 76) || (x_coordinate >= 85 && x_coordinate <=93))
            oled_data = 16'hFFFF; //white    
    end
    
   if(y_coordinate == 23)
   begin 
       if(x_coordinate == 11 || x_coordinate == 12 || x_coordinate == 21 || (x_coordinate >= 26 && x_coordinate <= 28) || x_coordinate == 33 || x_coordinate == 34 || x_coordinate == 46 || x_coordinate == 47 || x_coordinate == 65 || x_coordinate == 78 || x_coordinate == 83 || x_coordinate == 94)
        oled_data = 16'd0; // black
       
       if((x_coordinate >= 13 && x_coordinate <= 20) || (x_coordinate >= 29 && x_coordinate <= 32) || (x_coordinate >= 35 && x_coordinate <= 45)||(x_coordinate >= 48 && x_coordinate <=64) || (x_coordinate >= 66 && x_coordinate <= 77) || (x_coordinate>= 84 && x_coordinate <= 93))
         oled_data = 16'hFFFF; //white   
   end 
   
   if(y_coordinate == 24)
   begin
        if(x_coordinate == 10 || x_coordinate == 11 || x_coordinate == 22 || x_coordinate == 26 || x_coordinate == 33 || x_coordinate == 47 || x_coordinate == 64 || x_coordinate == 65 || x_coordinate == 78 || x_coordinate == 79 || x_coordinate == 82 || x_coordinate == 95)
            oled_data = 16'd0; // black
        
        if((x_coordinate >= 12 && x_coordinate <= 21) || (x_coordinate >= 27 && x_coordinate <= 32) || (x_coordinate >= 34 && x_coordinate <= 46) || (x_coordinate >= 52 && x_coordinate <= 62) || x_coordinate == 66 || x_coordinate == 67 || (x_coordinate >=69 && x_coordinate <= 77) || (x_coordinate >= 83 && x_coordinate <=94))
            oled_data = 16'hFFFF; // white     
    
        if((x_coordinate >=48 && x_coordinate <= 51) || x_coordinate == 63)
            oled_data = 16'h0B9D; // indigo
            
        if(x_coordinate == 68)
            oled_data = 16'hCE79; // smoke grey    
   end  
   
   if(y_coordinate == 25)
   begin 
        if(x_coordinate == 10 || x_coordinate == 22 || x_coordinate == 25 || x_coordinate == 32 || x_coordinate == 48 || x_coordinate == 64 || x_coordinate == 79 || x_coordinate == 81 || x_coordinate == 95)
            oled_data = 16'd0; // black
        
        if((x_coordinate >= 11 && x_coordinate <= 21) || (x_coordinate >= 26 && x_coordinate <= 31) || (x_coordinate >= 33 && x_coordinate <= 47 ) || (x_coordinate >= 58 && x_coordinate <= 60) || (x_coordinate >= 70 && x_coordinate <= 75) || (x_coordinate >= 84 && x_coordinate <= 95))
            oled_data = 16'hFFFF; // white 
        
        if((x_coordinate >= 49 && x_coordinate <= 57) || (x_coordinate >= 61 && x_coordinate <= 63) || (x_coordinate >= 76 && x_coordinate <= 78) || x_coordinate == 82 || x_coordinate == 83) 
            oled_data = 16'h0B9D; // indigo
            
        if(x_coordinate >= 65 && x_coordinate <= 69)
            oled_data = 16'hCE79;            
   end  
   
   if(y_coordinate == 26)
   begin
        if(x_coordinate == 9 || x_coordinate == 10 || x_coordinate == 22 || x_coordinate == 23 || x_coordinate == 25 || x_coordinate == 31 || x_coordinate == 32 || (x_coordinate >= 49 && x_coordinate <= 52) || x_coordinate == 63 || x_coordinate == 80)
            oled_data = 16'd0; // black
            
        if((x_coordinate >= 11 && x_coordinate <= 21) || (x_coordinate >= 26 && x_coordinate <= 30 ) || (x_coordinate >= 34 && x_coordinate <= 45 ) || (x_coordinate >= 71 && x_coordinate <= 73) || (x_coordinate >= 84 && x_coordinate <=92))
            oled_data = 16'hFFFF; // white 
        
        if(x_coordinate == 33 || (x_coordinate >= 46 && x_coordinate <= 48)|| (x_coordinate >= 53 && x_coordinate <= 62) || (x_coordinate >= 74 && x_coordinate <= 79) || (x_coordinate >= 81 && x_coordinate <= 83) || (x_coordinate >= 93 && x_coordinate <= 95))
           oled_data = 16'h0B9D; // indigo
           
       if(x_coordinate >= 64 && x_coordinate <= 70)
            oled_data = 16'hCE79; // smoke grey             
   end
   
   if(y_coordinate == 27)
   begin 
    if(x_coordinate == 9  || x_coordinate == 23 || x_coordinate == 24 || x_coordinate == 31 || x_coordinate == 52 || x_coordinate == 63 || x_coordinate == 81 )
        oled_data = 16'd0; // black
    
    if((x_coordinate >= 12 && x_coordinate <= 22) || (x_coordinate >= 35 && x_coordinate <= 43) || (x_coordinate >= 85 && x_coordinate <= 89))
        oled_data = 16'hFFFF;
        
    if(x_coordinate == 10 || x_coordinate == 11 || (x_coordinate >= 32 && x_coordinate <= 34) || (x_coordinate >= 44 && x_coordinate <= 51) || (x_coordinate >= 53 && x_coordinate <= 62) || (x_coordinate >= 72 && x_coordinate <= 80 ) || (x_coordinate >= 82 && x_coordinate <= 84) || (x_coordinate >= 90 && x_coordinate <= 95))    
        oled_data = 16'h0B9D; // indigo
   
       if(x_coordinate >= 64 && x_coordinate <= 71)
             oled_data = 16'hCE79; // smoke grey          
   end
   
   if(y_coordinate == 28)
   begin
    if(x_coordinate == 8 || x_coordinate == 9 || x_coordinate == 23 || x_coordinate == 24 || x_coordinate == 31 || x_coordinate == 53 || x_coordinate == 62 || x_coordinate == 81)
        oled_data = 16'd0; // black
    
    if((x_coordinate >= 12 && x_coordinate <= 22) || (x_coordinate >= 36 && x_coordinate <= 41))
        oled_data = 16'hFFFF; // white 
        
    if(x_coordinate == 10 || x_coordinate == 11 || (x_coordinate >=25 && x_coordinate <= 28) || (x_coordinate >= 32 && x_coordinate <= 35) ||(x_coordinate >= 42 && x_coordinate <= 52) || (x_coordinate >=54 && x_coordinate <= 61) || x_coordinate == 63 || (x_coordinate >= 73 && x_coordinate <= 80) || (x_coordinate >= 82 && x_coordinate <= 95))    
        oled_data = 16'h0B9D; // indigo*/
        
       if(x_coordinate >= 64 && x_coordinate <= 72)
              oled_data = 16'hCE79; // smoke grey  
                      
   end 
   
   if(y_coordinate == 29)
   begin
    if(x_coordinate >= 3 && x_coordinate <= 7 || x_coordinate == 24 || x_coordinate == 30 || x_coordinate == 53 || x_coordinate == 61 || x_coordinate == 62 || x_coordinate == 81)
        oled_data = 16'd0;  //black
    
    if((x_coordinate >= 17 && x_coordinate <= 19) || (x_coordinate >= 37 && x_coordinate <= 41))
        oled_data = 16'hFFFF; //white 
    
    if((x_coordinate >= 11 && x_coordinate <= 16 ) || (x_coordinate >= 20 && x_coordinate <= 23) || (x_coordinate  >= 31 && x_coordinate <= 36) || (x_coordinate >= 42 && x_coordinate <=52) || (x_coordinate >= 54 && x_coordinate <= 60) || x_coordinate == 63 || x_coordinate ==  64 || (x_coordinate >= 73 && x_coordinate <= 80) || (x_coordinate >= 82 && x_coordinate <= 95))
        oled_data = 16'h0B9D;  //indigo 
        
    if(x_coordinate >= 8 && x_coordinate <= 10)
        oled_data = 16'h0401;// dark green
        
    if(x_coordinate >= 65 && x_coordinate <= 72)
        oled_data = 16'hCE79;  //smoke grey        
   end 
   
   if(y_coordinate == 30)
   begin 
        if(x_coordinate == 2 || x_coordinate == 24 || x_coordinate == 29 || x_coordinate == 30 || x_coordinate == 54 || x_coordinate == 60 || x_coordinate == 61 || (x_coordinate >= 81 && x_coordinate <= 83))
            oled_data = 16'd0; // black
        
        if((x_coordinate >=3 && x_coordinate <=5) || x_coordinate == 38 || x_coordinate == 39)
            oled_data = 16'hFFFF; //white 
        
        if((x_coordinate >= 13 && x_coordinate <= 23) || (x_coordinate >= 31 && x_coordinate <= 37) || (x_coordinate >= 40 && x_coordinate <= 53) || (x_coordinate >= 55 && x_coordinate <= 59) || (x_coordinate >= 62 && x_coordinate <= 66) || (x_coordinate >= 73 && x_coordinate <= 80) || (x_coordinate >= 84 && x_coordinate <= 95))
            oled_data = 16'h0B9D; // indigo
            
        if(x_coordinate >= 6 && x_coordinate <= 12)
            oled_data = 16'h0401; // dark green
            
        if(x_coordinate >= 67 && x_coordinate <= 72)
            oled_data = 16'hCE79; //smoke grey                
   end
   
   if(y_coordinate == 31)
   begin
        if(x_coordinate == 1 || x_coordinate == 25 || x_coordinate == 29 || x_coordinate == 54 || x_coordinate == 59 || x_coordinate == 60 || x_coordinate == 83 || x_coordinate == 84 || x_coordinate == 75)
            oled_data = 16'd0; //black
            
        if(x_coordinate >= 2 && x_coordinate <= 4)
            oled_data = 16'hFFFF; // white
            
        if((x_coordinate >= 14 && x_coordinate <= 24 ) || (x_coordinate >= 26 && x_coordinate <=28) || (x_coordinate >= 30 && x_coordinate <= 53 ) || (x_coordinate >= 55 && x_coordinate <= 58 ) || (x_coordinate >= 61 && x_coordinate <= 67) || x_coordinate == 73 || x_coordinate == 74 || (x_coordinate >= 76 && x_coordinate <= 82) || (x_coordinate >= 85 && x_coordinate <= 95))
            oled_data = 16'h0B9D; // indigo
            
        if(x_coordinate == 5 || x_coordinate == 6 || (x_coordinate >= 8 && x_coordinate <= 13))
            oled_data = 16'h0401; // dark green
            
        if(x_coordinate >= 68 && x_coordinate <= 72)
            oled_data = 16'hCE79; // smoke grey            
        
        if(x_coordinate == 7)    
            oled_data = 16'hF8C0; // red 
   end
   
   if(y_coordinate == 32)
   begin 
        if(x_coordinate == 0 || x_coordinate == 25 || x_coordinate == 28 || x_coordinate == 29 || x_coordinate == 54 || x_coordinate == 59 || (x_coordinate >= 69 && x_coordinate  <= 72) || x_coordinate == 74 || x_coordinate == 76 || x_coordinate == 85)
            oled_data = 16'd0;//black
        
        if(x_coordinate == 1 || x_coordinate == 2 ||(x_coordinate >= 15 && x_coordinate <= 24) || x_coordinate == 26 || x_coordinate == 27 || (x_coordinate >= 30 && x_coordinate <= 53) || (x_coordinate >= 55 && x_coordinate <= 58 ) || (x_coordinate >= 60 && x_coordinate <= 68) || x_coordinate == 73 || (x_coordinate >= 77 && x_coordinate <= 84) || (x_coordinate >= 86 && x_coordinate <= 95))
            oled_data = 16'h0B9D;//indigo
        
        if((x_coordinate >= 3 && x_coordinate <= 9) || (x_coordinate >= 11 && x_coordinate <= 14))
            oled_data = 16'h0401; // dark green 
        
        if(x_coordinate == 10 || x_coordinate == 75)
            oled_data = 16'hF8C0; // red
            
   end
   
   if(y_coordinate == 33)
   begin
        if(x_coordinate == 25 || x_coordinate == 27 || x_coordinate == 55 || x_coordinate == 58 || x_coordinate == 59 || x_coordinate == 69 || x_coordinate == 72 || x_coordinate == 73 || x_coordinate == 77 || x_coordinate == 85)
            oled_data = 16'd0;
        
        if(x_coordinate == 0 || x_coordinate == 1 || (x_coordinate >= 16 && x_coordinate <= 24 ) || x_coordinate == 26 || (x_coordinate >= 28 && x_coordinate <= 54) || x_coordinate == 56 || x_coordinate == 57 || (x_coordinate >= 60 && x_coordinate <= 68) || (x_coordinate >= 78 && x_coordinate <= 84 ) || (x_coordinate >= 86 && x_coordinate <=95))
            oled_data = 16'h0B9D; //indigo
            
        if(x_coordinate >= 2 && x_coordinate <= 15)
            oled_data = 16'h0401; // dark green 
        
        if(x_coordinate == 70 || x_coordinate == 71)
            oled_data = 16'h8C71; // grey
            
        if(x_coordinate >= 74 && x_coordinate <= 76)
                oled_data = 16'hF8C0; // red
   end
   
   if(y_coordinate == 34)
   begin 
        if(x_coordinate == 26 || x_coordinate == 55 || x_coordinate == 58 || x_coordinate == 69 || x_coordinate == 72 || x_coordinate == 78 || x_coordinate == 86)
            oled_data = 16'd0; // black
        
        if(x_coordinate == 0 || x_coordinate == 1 || (x_coordinate >= 17 && x_coordinate <= 25) || (x_coordinate >= 27 && x_coordinate <= 54) || x_coordinate == 56 || x_coordinate == 57 || (x_coordinate >= 59 && x_coordinate <= 68) || (x_coordinate >= 79 && x_coordinate <= 85) || (x_coordinate >= 87 && x_coordinate <= 95))
            oled_data = 16'h0B9D; // indigo
            
        if(x_coordinate == 2 || x_coordinate == 3 || (x_coordinate >= 5 && x_coordinate <= 16))
            oled_data = 16'h0401; // dark green 
            
        if(x_coordinate == 4 || (x_coordinate >= 73 && x_coordinate <= 77))
            oled_data = 16'hF8C0; // red   

        if(x_coordinate == 70 || x_coordinate == 71)
            oled_data = 16'h8C71; // grey      
   end
   
   if(y_coordinate == 35)
   begin
        if(x_coordinate == 26 || x_coordinate == 56 || x_coordinate == 57 || x_coordinate == 69 || x_coordinate == 71 || x_coordinate == 79 || x_coordinate == 87) 
            oled_data = 16'd0; // black
            
        if(x_coordinate == 0 || (x_coordinate >= 18 && x_coordinate <= 25) || (x_coordinate >= 27 && x_coordinate <= 55) || (x_coordinate >= 58 && x_coordinate <= 68) || (x_coordinate >= 80 && x_coordinate <= 86) || (x_coordinate >= 88 && x_coordinate <= 95))
            oled_data = 16'h0B9D; //indigo  
            
        if((x_coordinate >= 1 && x_coordinate <= 6) || (x_coordinate >= 8 && x_coordinate <= 12 ) || (x_coordinate >= 14 && x_coordinate <= 17 ))
            oled_data = 16'h0401; // dark green 
        
        if(x_coordinate == 7 || x_coordinate == 13 || (x_coordinate >= 72 && x_coordinate <= 78))
            oled_data = 16'hF8C0; // red     
           
        if(x_coordinate == 70)
                oled_data = 16'h8C71; // grey        
   end
   
   if(y_coordinate == 36)
   begin 
        if(x_coordinate == 25 || x_coordinate == 56 || x_coordinate == 69 || x_coordinate == 70 || x_coordinate == 80 || x_coordinate == 88)
            oled_data = 16'd0; // black
            
        if(x_coordinate == 0 || (x_coordinate >= 18 && x_coordinate <= 24) || (x_coordinate >= 26 && x_coordinate <= 55) || (x_coordinate >= 57 && x_coordinate <= 68) || (x_coordinate >= 81 && x_coordinate <= 87) || (x_coordinate >= 89 && x_coordinate <= 95))
            oled_data  = 16'h0B9D; //indigo
            
        if((x_coordinate >= 1 && x_coordinate <= 9) || (x_coordinate >= 11 && x_coordinate <= 15) || x_coordinate == 17)    
            oled_data = 16'h0401; // dark green
        
        if(x_coordinate == 10 || x_coordinate == 16 || (x_coordinate >= 71 && x_coordinate <= 79))
            oled_data = 16'hF8C0; // red    
   end
   
   if(y_coordinate == 37)
   begin
        if(x_coordinate == 24 || x_coordinate == 57 || x_coordinate == 69 || x_coordinate == 81 || x_coordinate == 89 || x_coordinate == 90) 
            oled_data = 16'd0; //black
            
        if(x_coordinate == 0 || (x_coordinate >= 18 && x_coordinate <= 23) || (x_coordinate >= 25 && x_coordinate <= 56) || (x_coordinate >= 58 && x_coordinate <= 68) || (x_coordinate >= 82 && x_coordinate <= 88) || (x_coordinate >= 91 && x_coordinate <= 95))
            oled_data = 16'h0B9D; // indigo
            
        if(x_coordinate >= 1 && x_coordinate <= 17)
            oled_data = 16'h0401; //dark green
            
        if(x_coordinate >= 70 && x_coordinate <= 80)
            oled_data = 16'hF8C0;    
   end
   
   if(y_coordinate == 38)
   begin
        if(x_coordinate == 24 || x_coordinate == 57 || (x_coordinate >= 68 && x_coordinate <= 82) || (x_coordinate >= 91 && x_coordinate <= 92))
            oled_data = 16'd0; // black
            
        if(x_coordinate == 0 || (x_coordinate >= 18 && x_coordinate <= 23) || (x_coordinate >= 25 && x_coordinate <= 56) || (x_coordinate >= 58 && x_coordinate <= 67) || (x_coordinate >= 83 && x_coordinate <= 90)|| (x_coordinate >= 93 && x_coordinate <= 95))
            oled_data = 16'h0B9D; // indigo
            
        if(x_coordinate == 1 || (x_coordinate >= 3 && x_coordinate <= 13) || (x_coordinate >= 15 && x_coordinate <= 17))
            oled_data = 16'h0401; // dark green 
            
        if(x_coordinate == 2 || x_coordinate == 14)
            oled_data = 16'hF8C0; // red    
   end 
   
   if(y_coordinate == 39) // check later 
   begin
        if(x_coordinate == 23 || x_coordinate == 24 || x_coordinate == 58 || x_coordinate == 68 || x_coordinate == 82 || x_coordinate == 93)
            oled_data = 16'd0; // black
        
        if(x_coordinate == 0 || (x_coordinate >= 18 && x_coordinate <= 22) || (x_coordinate >= 25 && x_coordinate <= 57 ) || (x_coordinate >= 58 && x_coordinate <= 67) || (x_coordinate >= 83 && x_coordinate <= 92) || x_coordinate == 94 || x_coordinate == 95)
            oled_data = 16'h0B9D; // indigo
            
        if((x_coordinate >= 1 && x_coordinate <= 6) || (x_coordinate >= 8 && x_coordinate <= 17))
            oled_data = 16'h0401; // dark green
            
        if(x_coordinate == 7)
            oled_data = 16'hF8C0; // RED
            
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
   end
   
   if(y_coordinate == 40)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; // black
        
        if(x_coordinate >= 1 && x_coordinate <= 17)
            oled_data = 16'h0401; // dark green 
            
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
   end
   
   if(y_coordinate == 41)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; //black
            
        if((x_coordinate >= 1 && x_coordinate <= 3) || (x_coordinate>=5 && x_coordinate <= 10) || (x_coordinate >= 12 && x_coordinate <= 15))
            oled_data = 16'h0401; // dark green
            
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
            
        if(x_coordinate == 4 || x_coordinate == 11)
            oled_data = 16'hF8C0; // Red
   end 
   
   if(y_coordinate == 42)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; //black
            
        if(x_coordinate >= 2 && x_coordinate <= 15)
            oled_data = 16'h0401; // dark green 
            
        if(x_coordinate >= 69 && x_coordinate <= 81)
                oled_data = 16'hFF80; // yellow
        
        if(x_coordinate >= 27 && x_coordinate <= 58)
                oled_data = 16'h4DDD; // LAKE BLUE        
   end
   
   if(y_coordinate == 43)
   begin
         if(x_coordinate == 68 || x_coordinate == 82)
             oled_data = 16'd0; //black
             
         if(x_coordinate >= 5 && x_coordinate <= 12)
             oled_data = 16'h0401; // dark green 
             
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow

        if(x_coordinate >= 25 && x_coordinate <= 60)
            oled_data = 16'h4DDD; // LAKE BLUE               
         
   end
   
   if(y_coordinate == 44)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; //black

        if(x_coordinate >= 8 && x_coordinate <= 10)
            oled_data = 16'hB4E0; // brown 

        if(x_coordinate >= 13 && x_coordinate <= 15)
            oled_data = 16'h0401; // dark green    
        
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
    
        if(x_coordinate >= 24 && x_coordinate <= 61)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end
   
   if(y_coordinate == 45)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; //black

        if((x_coordinate >= 8 && x_coordinate <= 10) || x_coordinate == 12)
            oled_data = 16'hB4E0; // brown 

        if((x_coordinate >= 3 && x_coordinate <= 5)||(x_coordinate >= 13 && x_coordinate <= 15))
            oled_data = 16'h0401; // dark green    
        
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
            
        if(x_coordinate >= 73 && x_coordinate <= 77)
            oled_data = 16'hF8C0;
    
        if(x_coordinate >= 23 && x_coordinate <= 63)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end
   
   if(y_coordinate == 46)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; //black

        if((x_coordinate >= 8 && x_coordinate <= 10) || x_coordinate == 12)
            oled_data = 16'hB4E0; // brown 

        if(x_coordinate >= 2 && x_coordinate <= 5)
            oled_data = 16'h0401; // dark green    
        
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
            
        if(x_coordinate >= 73 && x_coordinate <= 77)
            oled_data = 16'hF8C0; // red
    
        if(x_coordinate >= 22 && x_coordinate <= 63)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end
   
   if(y_coordinate == 47)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; //black

        if((x_coordinate == 5)||(x_coordinate >= 8 && x_coordinate <= 12))
            oled_data = 16'hB4E0; // brown 

        if(x_coordinate >= 3 && x_coordinate <= 5)
            oled_data = 16'h0401; // dark green    
        
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
            
        if(x_coordinate == 73 || x_coordinate == 77)
            oled_data = 16'hF8C0; // red
    
        if(x_coordinate >= 20 && x_coordinate <= 62)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end   
   
   if(y_coordinate == 48)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; //black

        if(x_coordinate >= 5 && x_coordinate <= 10)
            oled_data = 16'hB4E0; // brown 
    
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
            
        if(x_coordinate == 73 || x_coordinate == 74 || x_coordinate == 77)
            oled_data = 16'hF8C0; // red
    
        if(x_coordinate >= 19 && x_coordinate <= 61)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end 
   
   if(y_coordinate == 49)
   begin
        if(x_coordinate == 68 || x_coordinate == 82)
            oled_data = 16'd0; //black

        if((x_coordinate >= 8 && x_coordinate <= 10))
            oled_data = 16'hB4E0; // brown 
        
        if(x_coordinate >= 69 && x_coordinate <= 81)
            oled_data = 16'hFF80; // yellow
            
        if(x_coordinate == 73 || x_coordinate == 77)
            oled_data = 16'hF8C0; // red
    
        if(x_coordinate >= 19 && x_coordinate <= 59)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end
   
   if(y_coordinate == 50)
   begin
        if(x_coordinate >= 68 && x_coordinate <= 82)
            oled_data = 16'd0; //black

        if((x_coordinate >= 8 && x_coordinate <= 10))
            oled_data = 16'hB4E0; // brown
            
        if(x_coordinate >= 18 && x_coordinate <= 56)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end   
   
   if(y_coordinate == 51)
   begin

        if((x_coordinate >= 8 && x_coordinate <= 10))
            oled_data = 16'hB4E0; // brown
            
        if(x_coordinate >= 19 && x_coordinate <= 54)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end 
   
   if(y_coordinate == 52)
   begin

        if((x_coordinate >= 8 && x_coordinate <= 10))
            oled_data = 16'hB4E0; // brown
            
        if(x_coordinate >= 19 && x_coordinate <= 51)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end 
   
   if(y_coordinate == 53)
   begin    
        if(x_coordinate >= 20 && x_coordinate <= 46)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end 
   
   if(y_coordinate == 54)
   begin    
        if(x_coordinate >= 27 && x_coordinate <= 43)
            oled_data = 16'h4DDD; // LAKE BLUE                      
   end   
    // algorithm for ball catcher 
/*    if (flag == 0)
    begin
        if(y_coordinate == 56)
        begin
            if(x_coordinate >= var1 + 2 && x_coordinate <= var1 + 20)
                oled_data = 16'h9491;
        end 
        
        if(y_coordinate == 57)
        begin
            
            if(x_coordinate >= var1  && x_coordinate <= var1 + 1) 
                oled_data = 16'h9491;
             
            
            if(x_coordinate >= var1 + 3 && x_coordinate <= var1 + 19 )
                oled_data = 16'd0;
                
            if(x_coordinate >= var1 + 20 && x_coordinate <= var1 + 21)
                oled_data = 16'h9491;    
        end

        if(y_coordinate == 58)
        begin
            
            if(x_coordinate >= var1 && x_coordinate <= var1 + 1) 
                oled_data = 16'h9491;
             
            
            if(x_coordinate >= var1 + 3 && x_coordinate <= var1 + 19)
                oled_data = 16'd0;
                
            if(x_coordinate >= var1 + 20  && x_coordinate <= var1 + 21 )
                oled_data = 16'h9491;    
        end
        
        if(y_coordinate >= 59 && y_coordinate <64)
        begin
            if(x_coordinate >= var1  && x_coordinate <= var1 + 22) 
                oled_data = 16'h9491;
        end
        
        var1 = (counter == 14'b11_1111_1111_1111)? var1 + 1 : var1;
        counter = (counter == 14'b11_1111_1111_1111)?0:counter +1;
        
        if(var1 + 22 == 95)
        begin   
            //var = 0;  
            flag = 1;
        end     
     end 

if (flag == 1)
    begin
        if(y_coordinate == 56)
        begin
            if(x_coordinate >= var1 + 2 && x_coordinate <= var1 + 20)
                oled_data = 16'h9491;
        end 
        
        if(y_coordinate == 57)
        begin
            
            if(x_coordinate >= var1  && x_coordinate <= var1 + 1) 
                oled_data = 16'h9491;
             
            
            if(x_coordinate >= var1 + 3 && x_coordinate <= var1 + 19 )
                oled_data = 16'd0;
                
            if(x_coordinate >= var1 + 21 && x_coordinate <= var1 + 21)
                oled_data = 16'h9491;    
        end

        if(y_coordinate == 58)
        begin
            
            if(x_coordinate >= var1 && x_coordinate <= var1 + 1) 
                oled_data = 16'h9491;
             
            
            if(x_coordinate >= var1 + 3 && x_coordinate <= var1 + 20)
                oled_data = 16'd0;
                
            if(x_coordinate >= var1 + 21  && x_coordinate <= var1 + 22)
                oled_data = 16'h9491;    
        end
        
        if(y_coordinate >= 59 && y_coordinate <64)
        begin
            if(x_coordinate >= var1  && x_coordinate <= var1 + 22) 
                oled_data = 16'h9491;
        end
        
        //var = var - 1;
        var1 = (counter == 14'b11_1111_1111_1111)? var1 - 1 : var1;
        counter = (counter == 14'b11_1111_1111_1111)?0:counter +1;
        
        
        if(var1 == 0)
        begin   
            //var = 0;  
            flag = 0;
        end     
     end*/   
     
     //Algorithm for the falling balls
     if(center_button_result == 1)
     begin 
        release_flag = 1;
     end 
              
     if(right_button_result == 1 && release_flag == 0)
     begin
        if(var2 + 6 != 95)
        begin
        var2 = (counter2 == 16'b1111_1111_1111_1111)? var2 + 1 : var2;
        counter2 = (counter2 == 16'b1111_1111_1111_1111)?0:counter2 +1;
        end     
     end
     
     if(left_button_result == 1 && release_flag == 0)
     begin
        if(var2 != 0)
        var2 = (counter2 == 16'b1111_1111_1111_1111)? var2 - 1 : var2;
        counter2 = (counter2 == 16'b1111_1111_1111_1111)?0:counter2 +1;
     end 
     
 if(release_flag == 0)begin    
     if(y_coordinate == 0)
     begin
        if(x_coordinate >= 1 + var2 && x_coordinate <=5 + var2)
        begin
            oled_data = 16'd0; 
        end 
     end   
     
     if(y_coordinate == 1)
     begin 
        if(x_coordinate >= 0 + var2 && x_coordinate <= 6 + var2)
        begin 
            oled_data = 16'd0;
        end
     end 
     
     if(y_coordinate == 2)
     begin
        if(x_coordinate >= 0 + var2 && x_coordinate <= 6 + var2)
        begin
            oled_data = 16'd0; 
        end
     end
     
     if(y_coordinate == 3)
     begin 
        if(x_coordinate >= 0 + var2 && x_coordinate <= 6 + var2)
        begin 
            oled_data = 16'd0;
        end 
     end
     
     if(y_coordinate == 4)
     begin
        if(x_coordinate >= 0 + var2 && x_coordinate <= 6 + var2)
        begin 
            oled_data = 16'd0;
        end  
     end
     
     if(y_coordinate == 5)
     begin
        if(x_coordinate >= 1 + var2 && x_coordinate <= 5 + var2)
        begin
            oled_data = 16'd0;
        end 
     end
 end    
     //algorithm for making ball fall
     
     if(release_flag == 1)
     begin
        if(y_coordinate == var3)
        begin
            if(x_coordinate >= 1 + var2 && x_coordinate <=5 + var2)
            begin
                oled_data = 16'd0; 
            end 
        end   
     
        if(y_coordinate == 1 + var3)
        begin 
            if(x_coordinate >= 0 + var2 && x_coordinate <= 6 + var2)
            begin 
                oled_data = 16'd0;
            end
        end 
     
        if(y_coordinate == 2 + var3)
        begin
            if(x_coordinate >= 0 + var2 && x_coordinate <= 6 + var2)
            begin
                oled_data = 16'd0; 
            end
        end
     
        if(y_coordinate == 3 + var3)
        begin 
            if(x_coordinate >= 0 + var2 && x_coordinate <= 6 + var2)
            begin 
                oled_data = 16'd0;
            end 
        end
     
        if(y_coordinate == 4 + var3)
        begin
            if(x_coordinate >= 0 + var2 && x_coordinate <= 6 + var2)
            begin 
                oled_data = 16'd0;
            end  
        end
     
        if(y_coordinate == 5 + var3)
        begin
            if(x_coordinate >= 1 + var2 && x_coordinate <= 5 + var2)
            begin
                oled_data = 16'd0;
            end 
        end 
        
        if(var3 != 58)
        begin 
        var3 = (counter3 == 14'b11_1111_1111_1111)? var3 + 1 : var3;
        counter3 = (counter3 == 14'b11_1111_1111_1111)?0:counter3 +1;
        end 
        
        else 
        begin
            var3 = 0;
            release_flag =0;
        end 
     end
     
    // algorithm for ball catcher 
     if (flag == 0)
     begin
         if(y_coordinate == 56)
         begin
             if(x_coordinate >= var1 + 2 && x_coordinate <= var1 + 20)
                 oled_data = 16'h9491;
         end 
         
         if(y_coordinate == 57)
         begin
             
             if(x_coordinate >= var1  && x_coordinate <= var1 + 1) 
                 oled_data = 16'h9491;
              
             
             if(x_coordinate >= var1 + 3 && x_coordinate <= var1 + 19 )
                 oled_data = 16'd0;
                 
             if(x_coordinate >= var1 + 20 && x_coordinate <= var1 + 21)
                 oled_data = 16'h9491;    
         end
 
         if(y_coordinate == 58)
         begin
             
             if(x_coordinate >= var1 && x_coordinate <= var1 + 1) 
                 oled_data = 16'h9491;
              
             
             if(x_coordinate >= var1 + 3 && x_coordinate <= var1 + 19)
                 oled_data = 16'd0;
                 
             if(x_coordinate >= var1 + 20  && x_coordinate <= var1 + 21 )
                 oled_data = 16'h9491;    
         end
         
         if(y_coordinate >= 59 && y_coordinate <64)
         begin
             if(x_coordinate >= var1  && x_coordinate <= var1 + 22) 
                 oled_data = 16'h9491;
         end
         
         var1 = (counter == 14'b11_1111_1111_1111)? var1 + 1 : var1;
         counter = (counter == 14'b11_1111_1111_1111)?0:counter +1;
         
         if(var1 + 22 == 95)
         begin   
             //var = 0;  
             flag = 1;
         end     
      end 
 
 if (flag == 1)
     begin
         if(y_coordinate == 56)
         begin
             if(x_coordinate >= var1 + 2 && x_coordinate <= var1 + 20)
                 oled_data = 16'h9491;
         end 
         
         if(y_coordinate == 57)
         begin
             
             if(x_coordinate >= var1  && x_coordinate <= var1 + 1) 
                 oled_data = 16'h9491;
              
             
             if(x_coordinate >= var1 + 3 && x_coordinate <= var1 + 19 )
                 oled_data = 16'd0;
                 
             if(x_coordinate >= var1 + 21 && x_coordinate <= var1 + 21)
                 oled_data = 16'h9491;    
         end
 
         if(y_coordinate == 58)
         begin
             
             if(x_coordinate >= var1 && x_coordinate <= var1 + 1) 
                 oled_data = 16'h9491;
              
             
             if(x_coordinate >= var1 + 3 && x_coordinate <= var1 + 20)
                 oled_data = 16'd0;
                 
             if(x_coordinate >= var1 + 21  && x_coordinate <= var1 + 22)
                 oled_data = 16'h9491;    
         end
         
         if(y_coordinate >= 59 && y_coordinate <64)
         begin
             if(x_coordinate >= var1  && x_coordinate <= var1 + 22) 
                 oled_data = 16'h9491;
         end
         
         //var = var - 1;
         var1 = (counter == 14'b11_1111_1111_1111)? var1 - 1 : var1;
         counter = (counter == 14'b11_1111_1111_1111)?0:counter +1;
         
         
         if(var1 == 0)
         begin   
             //var = 0;  
             flag = 0;
         end     
      end        
      
      // point system 
      if(var3 == 57)
      begin
        if(points_counter != 4'd10)
        begin
         if(var2 > var1 && var2+6 < var1 + 21 )
         begin     
         //points_counter = points_counter + 1;
               points_counter = (counter4 == 14'b11_1111_1111_1111)? points_counter + 1 : points_counter;
               counter4 = (counter4 == 14'b11_1111_1111_1111)?0:counter4 +1;            
         end
        end    
        
        else 
            points_counter = 4'd0;
      end 
      
      // displaying points on the seven segment 
      case(points_counter)
        4'd0: begin anode_seg_output = 4'b1100; led_seg_output = 7'b1000000; end
        4'd1: begin anode_seg_output = 4'b1100; led_seg_output = 7'b1111001; end
        4'd2: begin anode_seg_output = 4'b1100; led_seg_output = 7'b0100100; end
        4'd3: begin anode_seg_output = 4'b1100; led_seg_output = 7'b0110000; end
        4'd4: begin anode_seg_output = 4'b1100; led_seg_output = 7'b0011001; end
        4'd5: begin anode_seg_output = 4'b1100; led_seg_output = 7'b0010010; end
        4'd6: begin anode_seg_output = 4'b1100; led_seg_output = 7'b0000010; end
        4'd7: begin anode_seg_output = 4'b1100; led_seg_output = 7'b1111000; end 
        4'd8: begin anode_seg_output = 4'b1100; led_seg_output = 7'b0000000; end 
        4'd9: begin anode_seg_output = 4'b1100; led_seg_output = 7'b0010000; end
      endcase
end 
endmodule
