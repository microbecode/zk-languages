use dep::aztec::macros::aztec;

#[aztec]
contract Multiply {
    // docs:start:imports
    use aztec::prelude::{AztecAddress, Map};
    use value_note::{balance_utils, value_note::ValueNote};
    use easy_private_state::EasyPrivateUint;
    use aztec::macros::{storage::storage, functions::{initializer, private}};
    // docs:end:imports

    // docs:start:storage_struct
    #[storage]
    struct Storage<Context> {

    }
    // docs:end:storage_struct

    // docs:start:constructor
    #[initializer]
    #[private]
    fn constructor() {

    }
    // docs:end:constructor

    // docs:start:increment
    #[private]
    fn multiply(a: pub Field, b: Field) -> pub Field {
        a * b
    }


    // docs:start:test_imports
    use dep::aztec::test::{helpers::{cheatcodes, test_environment::TestEnvironment}};
    use dep::aztec::protocol_types::storage::map::derive_storage_slot_in_map;
    use dep::aztec::note::note_getter::{MAX_NOTES_PER_PAGE, view_notes};
    use dep::aztec::note::note_viewer_options::NoteViewerOptions;
    // docs:end:test_imports
    
}