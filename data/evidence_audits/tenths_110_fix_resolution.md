# Resolution of adversarial FAIL on unit 1639d595 (cycle 24)

Finding: `tenths_adversarial_fail.md`, VERDICT: FAIL. The unit was tokenized
as 十分の百 and modelled as `a*100/10 = a*10`; the pinned source reads
百十分の百 (100/110 = 10/11), giving a≈11× overstatement (a=110: 100 vs 1100;
a=1000: 909 vs 10000).

Action:
- Unit temporarily BLOCKED with `SPEC_FIDELITY_CONTRADICTION_ADVERSARIAL`.
- New module `JapanTaxLaw/FractionRates110.lean` computes `a*100/110`;
  independent reduced spec `a*10/11`; universal agreement proved in kernel
  (build 596 jobs, 0 errors). Counterexample values are regression tests.
- The six wrong TenthsFractions axes were removed and replaced with the
  FractionRates110 axes. The blocker was cleared because the contradiction
  is resolved, not because adversarial review passed.
- The TenthsFractions header/spec comments were corrected to N ∈ {1,2,5,7,9}
  and to document the reason for the split.
- No ADVERSARIAL_REVIEW axis is claimed for this unit.

H/T/D/C/U: H = rate is 100/110; T = verbatim source + counterexamples;
D = FAIL before fix, faithful after fix; C = 十分の百 is a substring of
百十分の百; U = 百八分の百 (100/108) special case still not modelled.
