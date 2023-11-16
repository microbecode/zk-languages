mod types;

contract Multiply {
    // Libs

    use dep::aztec::{
        note::{
            note_header::NoteHeader,
            utils as note_utils,
        },
        context::{Context}
    };

    use crate::types::{
        transparent_note::{TransparentNoteMethods, TRANSPARENT_NOTE_LEN},
        token_note::{TokenNoteMethods, TOKEN_NOTE_LEN},
    };

    struct Storage {
    }

    impl Storage {
        fn init(context: Context) -> pub Self {
            Storage {
            }
        }
    }

    // Required, even if empty
    #[aztec(private)]
    fn constructor() {
    }

    #[aztec(public)]
    fn multiply(
        a: Field, b: pub Field
    ) -> Field {
        a * b
    }

    // Computes note hash and nullifier.
    // Note 1: Needs to be defined by every contract producing logs.
    // Note 2: Having it in all the contracts gives us the ability to compute the note hash and nullifier differently for different kind of notes.
    unconstrained fn compute_note_hash_and_nullifier(contract_address: Field, nonce: Field, storage_slot: Field, serialized_note: [Field; TOKEN_NOTE_LEN]) -> [Field; 4] {
        let note_header = NoteHeader::new(contract_address, nonce, storage_slot);
        if (storage_slot == 5) {
            note_utils::compute_note_hash_and_nullifier(TransparentNoteMethods, note_header, serialized_note)
        } else {
            note_utils::compute_note_hash_and_nullifier(TokenNoteMethods, note_header, serialized_note)
        }
    }
}