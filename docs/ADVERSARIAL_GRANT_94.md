# Adversarial review — 地方交付税法 art. 6の2(2) 普通交付税 94%

Unit: `NORM|2485fde4475c83b98f617ad1f2d8f6543e766e59e6695c54c9cf94f7e1cc48c2`
Verbatim: 「毎年度分として交付すべき普通交付税の総額は、前条第二項の額の
百分の九十四に相当する額とする。」

- **H**: the reference to 前条第二項 could be silently resolved or the 94%
  applied to the wrong base; or 94/100 encoded as 94/1000.
- **T**: re-extract art. 6の2(2); parse 百分の九十四 → [94,100] (auditor D=PASS);
  inspect `ordinaryGrantTotal`; boundaries 0/1/50/100/10,000; `#print axioms`.
- **D**: verbatim located; constants [94,100] present in spec and impl. The
  base (前条第二項の額) is explicitly caller-established, not resolved by this
  unit. `rate_components` and `of_10_000` are axiom-free; `agree_spec_impl`
  uses standard `propext`. Floor rounding for non-integral results is a
  documented model choice, not a statutory claim from this sentence.
- **C**: treating the cross-reference as already proved is a competing reading;
  rejected — the dependency is explicitly out of scope.
- **U**: the previous article's base computation and human legal review pending.
