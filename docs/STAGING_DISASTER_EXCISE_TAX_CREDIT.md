# STAGING: DisasterExciseTaxCredit

- Normative id: NORM|d595659fb5709f6f1f3a41fb663587388f803cd980d1ede371062ebb1f215def
- Law: 322AC0000000175, revision 322AC0000000175_20220101_503AC0000000011, art. 7(1)
- Clause: 酒類又は製造たばこ、揮発油、石油ガス、原油、ガス状炭化水素若しくは石炭の製造者（石油ガスについては石油ガスの充てん者とし、原油、ガス状炭化水素又は石炭については原油、ガス状炭化水素又は石炭の採取者とする。以下この条において同じ。）又は販売業者（石油製品の販売業者を含む。以下この条において同じ。）が販売のために所持するこ…
- Model: bounded saturating arithmetic; credit = excise tax − cabinet-order compensation offset.
- Implementation: `JapanTaxLaw/DisasterExciseTaxCredit.lean`.
- Independent spec: `JapanTaxLaw/DisasterExciseTaxCreditSpec.lean`.
- Tests: `JapanTaxLaw/DisasterExciseTaxCreditTests.lean` (eight kernel-decided examples).
- Review: `docs/adversarial/reviews-disaster-excise-tax-credit.md`.
- NOT MODELLED: 政令の補塡額計算、他税目・義務者認定、加算税、適用手続。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
