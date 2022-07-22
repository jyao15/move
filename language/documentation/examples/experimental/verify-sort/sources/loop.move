// exclude_for: cvc5
module 0x42::VerifySort {
    public fun test_loop_induction(x: u64) {
        spec {
            assume x >= 0 && x <= 2;
        };
        let y = x + 1;
        while
        ({
            spec {
                invariant x < 10;
                invariant y == x + 1;
            };
            (x < 8)
        })
        {
            x = x + 3;
            y = y + 3;
        };
        spec {
            assert x >= 8 && x <= 10;
            assert y >= 9 && y <= 11;
        };
    }
}
