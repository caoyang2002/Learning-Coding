module test::vecc {

use aptos_framework::event;


    #[event]
   struct MintEvent has store,drop{
        mint_id:vector<u8>
    }
    
    entry public fun vectest(vec:vector<u8>){
        
          event::emit(
            MintEvent{
          
            mint_id:vec,
          }
        );
    }
}
    