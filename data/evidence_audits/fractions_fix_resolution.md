# Resolution of FractionAmounts adversarial FAIL (cycle 30)

Finding: `fractions_adversarial_fail.md`, VERDICT: FAIL. The collector stored
`(num, den) = (before-分の, after-分の)`, i.e. (denominator, numerator), while
`fracAmount amount num den := amount * num / den` expects numerator first.
Every one of the 301 units therefore computed the reciprocal: 百分の二十
stored (100,20) gave 5a instead of a/5; 十七分の十 stored (17,10) gave 17a/10
instead of 10a/17.

Resolution:
- All 301 units were BLOCKED with `SPEC_FIDELITY_CONTRADICTION_ADVERSARIAL`.
- Collected pairs swapped to `(num = after-分の, den = before-分の)`, matching
  the repository convention in `rate_consistency.py` (百分の六 → (6,100)).
- Evidence notes corrected; each unit now records the corrected fraction and
  a `correction` field pointing at the FAIL report.
- Blockers cleared **because the binding was corrected**, not because a new
  adversarial review passed. No ADVERSARIAL_REVIEW axis is claimed.
- The Lean arithmetic identity and its universal proof needed no change; the
  module header and examples were clarified to state the argument order.

H/T/D/C/U: H = num/den order reversed; T = 8 verbatim source phrases plus
Python counterexamples; D = FAIL before, corrected binding after; C = 日本語
`X分のY` is Y/X; U = none for the arithmetic identity.
