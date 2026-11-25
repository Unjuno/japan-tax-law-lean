# Resolution of the FloorRoundingMinimum adversarial FAIL (cycle 21)

Finding: `data/evidence_audits/floor_adversarial_fail.md` (VERDICT: FAIL).

Action: the 6 affected units were re-assigned to faithful models; the six
family axes from the unfaithful model were removed and replaced:

* 4 units with 五百円未満の端数 + 五百円以上千円未満を千円とする are now
  modelled by `JapanTaxLaw/HalfUpRounding.lean#roundHalfUpThousand`
  (nearest 1,000 yen, halves upward) — the pinned phrase is a remainder
  round-up, not a floor to a 500-yen multiple.
* 2 units with 五十銭未満/五十銭以上一円未満 are now modelled by
  `JapanTaxLaw/HalfSenRounding.lean#roundSen`, whose input is an integer
  number of 銭 (1 円 = 100 銭), so the 50-銭 boundary is representable.
  The implement/spec universal agreement is kernel proved.

Contradiction recorded (H/T/D/C/U):
H = the floor model misreads 端数 direction; T = 34,843-case Python
re-derivation + verbatim pinned phrases; D = FAIL for the old model, PASS
after re-modelling (kernel 590 jobs, 0 errors); C = 五百円以上千円未満を
千円とする is round-half-up; U = 五十銭 requires a sub-yen domain (resolvent:
input in 銭).

No ADVERSARIAL_REVIEW axis is claimed for the re-modelled units without a new
independent review. They remain PROVED_SCOPE; the blocker was removed because
the specific contradiction is resolved, not because adversarial review passed.
