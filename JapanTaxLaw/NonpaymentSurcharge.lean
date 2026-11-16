import JapanTaxLaw.TaxFinance

/-!
# NonpaymentSurcharge — 国税通則法 art. 67（不納付加算税）L4 モデル

Source (pinned):

  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: (data/raw/337AC0000000066_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models art. 67(1)(2) — pinned bytes 逐語:

  1項: 「源泉徴収等による国税がその法定納期限までに完納されなかつた場合には、税務署長又は税関長は、
       当該納税者から、納税の告知…に係る税額又はその法定納期限後に当該告知を受けることなく
       納付された税額に百分の十の割合を乗じて計算した金額に相当する不納付加算税を徴収する。
       ただし、…正当な理由があると認められる場合は、この限りでない。」
  2項: 「…その納付が、当該国税についての調査があつたことにより当該国税について当該告知が
       あるべきことを予知してされたものでないときは、その納付された税額に係る前項の
       不納付加算税の額は、同項の規定にかかわらず、当該納付された税額に百分の五の割合を
       乗じて計算した金額とする。」

Computation (Money = Nat, no coercion; 端数は切り捨て — 通則法 art. 118(3) の 1万円未満切り捨ては
既存 TaxRounding モジュールの射程。ここでは率の適用のみを行い、丸めは caller-established とする):

  baseRate           = 10 / 100   -- 百分の十
  reducedRate        =  5 / 100   -- 百分の五（2項の軽減）
  nonpaymentSurcharge tax reduced =
    if reduced then tax * 5 / 100 else tax * 10 / 100

Scope & honest boundaries:

* 「納税の告知に係る税額」「法定納期限後に納付された税額」は caller-established Money。
* 「正当な理由がある」「予知してされたものでない」は法的判断 — caller-established Bool `reduced`
  （2項の軽減が適用されるか）。1項ただし書（正当な理由）は適用除外 Bool として doc-comment のみに
  記載し、式には入れない（法令は「徴収する」という金額定義であり条件付きゼロではない）。
* 3項（政令で定める場合の適用除外・一月経過の期限）— NOT YET COVERED。
* 端数処理（art. 118(3): 課税標準1万円未満切り捨て 等）— 既存 TaxRounding.lean の射程、
  本モジュールは率適用のみ。重加算税（art. 68）— 別スライス。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 67(1) — 基本税率 百分の十。 -/
def nonpaymentSurchargeBasicRate : TaxRate := ⟨10, 100, by decide⟩

/-- art. 67(2) — 軽減税率 百分の五。 -/
def nonpaymentSurchargeReducedRate : TaxRate := ⟨5, 100, by decide⟩

/-- art. 67(1)(2) — 不納付加算税額。
    `reduced = true` は 2項の「予知してされたものでない」軽減が適用される場合。 -/
def nonpaymentSurcharge (tax : Money) (reduced : Bool) : Money :=
  if reduced then nonpaymentSurchargeReducedRate.applyFloor tax
  else nonpaymentSurchargeBasicRate.applyFloor tax

-- ==== verified facts ====

theorem nonpaymentSurcharge_basic (tax : Money) :
    nonpaymentSurcharge tax false = tax * 10 / 100 := by
  rfl

theorem nonpaymentSurcharge_reduced (tax : Money) :
    nonpaymentSurcharge tax true = tax * 5 / 100 := by
  rfl

/-- 軽減額は基本額以下。 -/
theorem nonpaymentSurcharge_reduced_le_basic (tax : Money) :
    nonpaymentSurcharge tax true ≤ nonpaymentSurcharge tax false := by
  unfold nonpaymentSurcharge nonpaymentSurchargeBasicRate nonpaymentSurchargeReducedRate TaxRate.applyFloor
  simp
  have h : tax * 5 ≤ tax * 10 := Nat.mul_le_mul_left tax (by decide)
  exact Nat.div_le_div_right h

/-- 加算税額は課税額を超えない。 -/
theorem nonpaymentSurcharge_le_tax (tax : Money) (reduced : Bool) :
    nonpaymentSurcharge tax reduced ≤ tax := by
  unfold nonpaymentSurcharge nonpaymentSurchargeBasicRate nonpaymentSurchargeReducedRate TaxRate.applyFloor
  split
  · have h : tax * 5 ≤ tax * 100 := Nat.mul_le_mul_left tax (by decide)
    have hdiv : tax * 5 / 100 ≤ tax * 100 / 100 := Nat.div_le_div_right h
    simpa using hdiv
  · have h : tax * 10 ≤ tax * 100 := Nat.mul_le_mul_left tax (by decide)
    have hdiv : tax * 10 / 100 ≤ tax * 100 / 100 := Nat.div_le_div_right h
    simpa using hdiv

-- ==== kernel-decided smoke checks ====

-- 1項: 100,000 × 10% = 10,000
example : nonpaymentSurcharge 100_000 false = 10_000 := by decide
-- 2項: 100,000 × 5% = 5,000
example : nonpaymentSurcharge 100_000 true = 5_000 := by decide
example : nonpaymentSurcharge 0 false = 0 := by decide
example : nonpaymentSurcharge 0 true = 0 := by decide
-- 切り捨て: 1 × 10 / 100 = 0
example : nonpaymentSurcharge 1 false = 0 := by decide

end JapanTaxLaw
