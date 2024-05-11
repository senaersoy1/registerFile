module register_file
    #(  parameter W_ADDR = 3,
                  W_DATA = 8
     )
    (
        input   clk,
        input   we,                       // write enable
        input   [W_ADDR-1:0] w_address,   // write address
        input   [W_ADDR-1:0] r_address,   // read address
        input   [W_DATA-1:0] w_data,      // reg'e yazılacak data 
        output  [W_DATA-1:0] r_data       // reg'den okunacak data    
    );
    
    reg [W_DATA-1:0] reg_file [2**W_ADDR-1:0];  // register file'ı burada oluşturuyoruz. Adres için 3 bit kullandım
                                                //data ve adres uyumlu olmalı, 3 adres bitiyle 8 dataya işaret edebilirim
                                                //burada da 8x8 bir matris oluşuyor, her register 8 bit, 8 adet register var
    
    always @(posedge clk)
        if(we)  // write enable olduğu durumda verilen data ilgili adrese yazılıyor
            reg_file[w_address] <= w_data;
            
    assign r_data = reg_file[r_address];
    
endmodule
