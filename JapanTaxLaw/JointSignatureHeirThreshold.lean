import JapanTaxLaw.TaxFinance

/-
# JointSignatureHeirThreshold — 印紙税法施行令 第十条（相続人が二人以上の場合の連署）

Pinned source:
  Law id: 342CO0000000108
  Official title: 印紙税法施行令
  Law number: 昭和四十二年政令第百八号
  Law type: CabinetOrder (政令)
  Revision: 342CO0000000108_20250401_507CO0000000006
  Raw snapshot: data/raw/342CO0000000108_20250401_507CO0000000006.law.json
  sha256: fcd1097f54737de069b8289eda6e6326e566926b2a03375cb16ad9cc69ace8d1
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10").
  Source path: law_full_text → Article[Num=10] → Paragraph[Num=5] →
  ParagraphSentence → Sentence[Num=1] (verified by independent re-extraction:
  1 structural hit, needle occurs verbatim once in the whole document).

原文逐語（pinned, 一字一句改変なし）:
  「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」

Variable contract:
  `heirs : Nat` = 相続人の数 (number of heirs), unit 人 (whole persons).
  `heirThreshold : Nat := 2` = 二人 (two heirs).
  「二人以上」 is INCLUSIVE (>= 2): exactly 2 heirs qualifies; 0 and 1 do not.
  `jointSignatureRequired heirs := decide (heirs >= heirThreshold)` is the
  Bool flag for the 連署 (joint-signature) requirement: true ⟺ 二人以上.

Scope: ONLY the explicit numeric condition is modelled — 二人 = 2 and 以上 =
inclusive `>=`. The joint-signature requirement itself is the derived Bool flag.
The preceding paragraph's 申告書 (前項の申告書), the signatories (各相続人), the
act of joint signing/submission (連署して提出する), procedural details, other
paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.JointSignatureHeirThreshold

/-- 二人 = 2 人. Unit 人; domain Nat. -/
def heirThreshold : Nat := 2

/-- 「相続人が二人以上」: the joint-signature (連署) requirement holds
    exactly when the number of heirs is at least 2 (以上 = inclusive >=). -/
def jointSignatureRequired (heirs : Nat) : Bool :=
  decide (heirs >= heirThreshold)

/-- Zero heirs is not 二人以上. -/
theorem zero_false : jointSignatureRequired 0 = false := by
  unfold jointSignatureRequired heirThreshold
  decide

/-- One heir is not 二人以上. -/
theorem one_false : jointSignatureRequired 1 = false := by
  unfold jointSignatureRequired heirThreshold
  decide

/-- Exactly two heirs (二人) qualifies: 以上 is inclusive. -/
theorem two_true : jointSignatureRequired 2 = true := by
  unfold jointSignatureRequired heirThreshold
  decide

/-- Three heirs qualifies. -/
theorem three_true : jointSignatureRequired 3 = true := by
  unfold jointSignatureRequired heirThreshold
  decide

/-- Direct-inequality monotonicity (no `Monotone`): if a count requires joint
    signature, any larger count does too. -/
theorem jointSignatureRequired_of_le {heirs heirs' : Nat}
    (h : jointSignatureRequired heirs = true) (hle : heirs <= heirs') :
    jointSignatureRequired heirs' = true := by
  unfold jointSignatureRequired heirThreshold at h ⊢
  apply decide_eq_true
  have hh : 2 <= heirs := of_decide_eq_true h
  omega

end JapanTaxLaw.JointSignatureHeirThreshold
