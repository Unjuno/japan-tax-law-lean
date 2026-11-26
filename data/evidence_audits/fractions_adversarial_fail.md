# Independent adversarial review — FractionAmounts: FAIL (systematic direction reversal)

Auditor: independent general subagent (session ses_dea3935afffei1LZVAeUDEmkxt).
Read-only audit of 301 units / 50 fractions. Not legal advice; not a
completeness claim.

## Verdict: FAIL
- Universal arithmetic identity is correct: 21,850 + 25,050 Python checks,
  0 mismatches between `a*num//den` and the quotient-remainder spec. All 301
  tokens verbatim in pinned sources; all 8 sampled phrases located; no
  tokenization trap (`百十分の百`) among the 50 pairs.
- **Genuine misread**: Japanese `X分のY` denotes **Y/X**, i.e. numerator Y
  (after 分の) over denominator X (before 分の). The collector stored
  `(num, den) = (before, after)`; `fracAmount a num den = a*num/den` then
  computes the **reciprocal** of every statutory fraction:
  - 百分の二十 stored (100,20) → 20% law, but model gives a*100/20 = 5a.
  - 十七分の十 stored (17,10) → 10/17 law, but model gives 17a/10.
  This affects all 301 units (50 pairs), not a subset.

## H/T/D/C/U
H = num/den order is reversed at the data–implementation boundary.
T = 8 verbatim source phrases (e.g. 百分の二十 → 20/100) + Python counterexamples.
D = FAIL. C = the pair (before-分の, after-分の) is (denominator, numerator),
whereas the Lean function's arguments are (numerator, denominator).
U = no uncertainty about the arithmetic identity; only the binding was wrong.

## Action
All 301 units were to be BLOCKED, then the collected pairs swapped to
(numerator=after-分の, denominator=before-分の), matching the repo convention
in `rate_consistency.py` (百分の六 → (6,100)). Evidence notes were corrected.
The generic Lean identity needs no change; its header/examples were corrected
to state the argument order explicitly. No ADVERSARIAL_REVIEW axis claimed.
