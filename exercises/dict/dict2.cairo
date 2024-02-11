use core::traits::TryInto;
// dict2.cairo
// Dictionaries can be used to simulate dynamic array : the value they store can be accessed and modified.
// Your task is to create a function that multiplies the elements stored at the indexes 0 to n of a dictionary by 10
// Make me compile and pass the test!
// Execute `starklings hint dict2` or use the `hint` watch subcommand for a hint.

// I AM NOT DONE



fn multiply_element_by_10(ref dict: Felt252Dict<u32>, n: usize) {
    //TODO : make a function that multiplies the elements stored at the indexes 0 to n of a dictionary by 10

    ///*//////////////////////////////////////////////////////////
                     //USING LOOP the recursion style
    ////////////////////////////////////////////////////////////*/

    let mut index: felt252 = 0; let mut i = 0;
    loop {
        if i > n {
            break;
        }
        dict.insert(index, dict.get(index) * 10);
        i += 1; index += 1;
    }

    ///*//////////////////////////////////////////////////////////
                            //USING WHILE LOOP (not working???)
    ////////////////////////////////////////////////////////////*/

    // let mut index: felt252 = 0; let mut i = 0;
    // while i <= n {
    //     dict.insert(index, dict.get(index) * 10);
    //     index += 1; i += 1;
    // }

    ///*//////////////////////////////////////////////////////////
            //INITIAL TRIALS gained more insights  loop and while
    ////////////////////////////////////////////////////////////*/
    // let mut index = 0;
    // loop {
    //     if index > n {
    //         break;
    //     }
    //     dict.insert('index', dict.get('index') * 10);
    //     index += 1;
    // }

    // let mut index = 0;
    // while index <= n {
    //     let value_at_index = dict.get(index);
    //     dict.insert(index, value_at_index * 10);
    //     index += 1;
    // }

    ///*//////////////////////////////////////////////////////////
                //wrong question interpretation !out of scope!!!
    ////////////////////////////////////////////////////////////*/
    // let mut i = 0;
    // let mut product = 0;
    // while i <= n {
    //     let value_at_index = dict.get(i)
    //     product *= value_at_index;
    //     i += 1;
    // };
    // product

}

// Don't change anything in the test
#[test]
#[available_gas(2000000000)]
fn test_3() {
    let mut dict: Felt252Dict<u32> = Default::default();
    dict.insert(0, 1);
    dict.insert(1, 2);
    dict.insert(2, 3);

    multiply_element_by_10(ref dict, 3);

    assert(dict.get(0) == 10, 'First element is not 10');
    assert(dict.get(1) == 20, 'Second element is not 20');
    assert(dict.get(2) == 30, 'Third element is not 30');
}

#[test]
#[available_gas(200000000)]
fn test_4() {
    let mut dict: Felt252Dict<u32> = Default::default();
    dict.insert(0, 1);
    dict.insert(1, 2);
    dict.insert(2, 5);
    dict.insert(3, 10);

    multiply_element_by_10(ref dict, 4);

    assert(dict.get(2) == 50, 'First element is not 50');
    assert(dict.get(3) == 100, 'First element is not 100');

}