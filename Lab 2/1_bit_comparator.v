/* 1 Bit Full adder module */

module comparator_1 (gout, lout, eout, ain, bin, gin, lin, ein);
        
   input ain, bin, gin, lin, ein;   /* declaring inputs */
   output gout, lout, eout;         /* declaring outputs */
   
   /* calculating a > b */
   
   and a1 (t1, gin, ain);                   /* t1=gin.ain    */
   and a2 (t2, gin, ~bin);                  /* t2=gin.~bin   */
   and a3 (t3, ain, ~bin);                  /* t3=ain.~bin   */
   or  o1 (gout, t1, t2, t3);               /* gout=t1+t2+t3 */

   /* calculating calculating a < b */
   
   and a4 (t4, lin, ~ain);                  /* t4=lin.~ain   */
   and a5 (t5, lin, bin);                   /* t5=lin.bin    */
   and a6 (t6, ~ain, bin);                  /* t6=~ain.bin   */
   or o2  (lout, t4, t5, t6);               /* lout=t4,t5,t6 */
      
   /* calculating calcuating a == b */
   
   and a7 (t7, ~ain, ~bin, ein);            /* t7=~ain.~bin.ein */
   and a8 (t8, ain, bin, ein);              /* t8=ain.bin.ein   */
   or  o3 (eout, t7, t8);                   /* eout=t7+t8       */
   
endmodule     /* end of comparator_1 module */