module comparator_4 ();

        reg [3:0] a, b;            /* declare data types of inputs a and b */
        reg gin, lin, ein;         /* declare data type of inputs gin, lin and ein */
        wire gout, lout, eout;     /* declare data type of outputs gout, lout, and eout */
        
/* Instantiate the 1 bit comparator module defined below to form the */
/* 4 blocks of comparator. The input values gin, lin, and ein are    */
/* explicitly set to 0. */
        
        comparator_1 C0(g1, l1, e1, a[0], b[0], gin, lin, ein);
        comparator_1 C1(g2, l2, e2, a[1], b[1], g1, l1, e1);   
        comparator_1 C2(g3, l3, e3, a[2], b[2], g2, l2, e2);   
        comparator_1 C3(gout, lout, eout, a[3], b[3], g3, l3, e3);  
        
/* Testbench to give the inputs and check the output values. The time */
/* variable, inputs and outputs are displayed. */
        
        initial begin                      /* Beginning of initial block */    
                
/* The monitor statement monitors the value of variables at all instants */
/*  and displays the result whenever there is any change. */

                $monitor ($time, "a=%b b=%b g1=%b g2=%b g3=%b l1=%b l2=%b l3=%b e1=%b e2=%b e3=%b gout=%b lout=%b eout=%b", a,b,g1,g2,g3,l1,l2,l3,e1,e2,e3,gout,lout,eout);
               
                /* output of some unique combinations */
                ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0000; b=4'b0000;   /* give specific input values */
                #100 $display ($time);                                /* display the time variable */
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0000; b=4'b0001;   
                #100 $display ($time); 
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0000; b=4'b1111; 
                #100 $display ($time);
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0001; b=4'b0000;   
                #100 $display ($time);                                
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0001; b=4'b0001;  
                #100 $display ($time); 
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0010; b=4'b0000;   
                #100 $display ($time); 
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0010; b=4'b1000;  
                #100 $display ($time);  
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0101; b=4'b0110;  
                #100 $display ($time); 
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b0110; b=4'b1010;  
                #100 $display ($time);
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b1011; b=4'b0111;  
                #100 $display ($time); 
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b1011; b=4'b1111; 
                #100 $display ($time);
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b1110; b=4'b1111; 
                #100 $display ($time);
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b1111; b=4'b0000;   
                #100 $display ($time);
                #900 ein=1'b1; gin=1'b0; lin=1'b0; a=4'b1111; b=4'b1111; 
                #100 $display ($time);
                
        end                         /* end of the initial block */

endmodule                           /* end of the comparator_4 module */