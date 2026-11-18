import JapanTaxLaw.TaxFinance

/-!
# InheritanceAnnuityMinMax — 相続税法 art. 24(1) 四号 および art. 24(3)(4)（一時金の給付金額／有期・終身の min・max 選択）bounded L4 モデル

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json

担当範囲の原文（一字も誤らず。needle として転記監査に渡す）:

  四号（art. 24(1) 四号）:
    「四第三条第一項第五号に規定する一時金その給付金額」
  ３項（art. 24(3) — いずれか少ない金額）:
    「…その権利者に対し、一定期間、かつ、その目的とされた者の生存中、
      定期金を給付する契約に基づくものの価額は、同項第一号に規定する
      有期定期金として算出した金額又は同項第三号に規定する終身定期金として
      算出した金額のいずれか少ない金額による。」
  ４項（art. 24(4) — いずれか多い金額）:
    「…その者が死亡したときはその権利者又はその遺族その他の第三者に対し
      継続して定期金を給付する契約に基づくものの価額は、同項第一号に規定する
      有期定期金として算出した金額又は同項第三号に規定する終身定期金として
      算出した金額のいずれか多い金額による。」

Computation (Money = Nat):

  lumpSumPaymentAmount amount          = amount                    -- 四号: 給付金額そのもの
  conditionalAnnuityValue term lifetime = min term lifetime          -- 3項: 少ない金額
  continuingAnnuityValue  term lifetime = max term lifetime          -- 4項: 多い金額
  annuityMinMaxValue isContinuing term lifetime =
    if isContinuing then continuingAnnuityValue term lifetime
    else conditionalAnnuityValue term lifetime                     -- 契約種別の選択のみ

Scope & honest boundaries:

  * 有期定期金・終身定期金の「として算出した金額」は caller-established Money。
    art. 24(1) の各号の max 構造（解約返戻金／一時金／ハの 3 値の max）は別モジュール
    JapanTaxLaw.InheritanceAnnuityMaxima（W-AnMax）が担当し、ここでは重複定義しない。
    複利年金現価率・予定利率・余命年数および平均額との乗除は NOT MODELLED。
  * 契約種別（3項か4項か）は caller-established Bool で選択する。Bool は金額の算術には
    入れず、2 つの既に Money に解決された値の選択にのみ現れる
    （`annuityMinMaxValue` を参照。SpecialOrderPensionMinimum と同型）。
  * 「一定期間かつ生存中」か「死亡後も継続して給付」かの該当性、給付事由の発生、
    第24条(2)（死亡による給付終了）・(5)（契約によらない定期金への準用）は
    caller-established / 対象外。
  * Pinned evidence は doc-comment にのみ置き、以下の定理はモデルの性質のみを主張する
    （法的意味の等価ではない。転記監査は fidelity-only）。小さな L4 スライスであり、
    完成・網羅を主張しない。
-/

namespace JapanTaxLaw.InheritanceAnnuityMinMax

open JapanTaxLaw.TaxFinance

/-- art. 24(1) 四号 — 第三条第一項第五号に規定する一時金の価額は「その給付金額」。 -/
def lumpSumPaymentAmount (amount : Money) : Money := amount

/-- art. 24(3) — 一定期間かつ生存中の定期金給付契約は、有期定期金として算出した金額と
    終身定期金として算出した金額の「いずれか少ない金額」= min。 -/
def conditionalAnnuityValue (termValue lifetimeValue : Money) : Money :=
  min termValue lifetimeValue

/-- art. 24(4) — 生存中給付かつ死亡後も継続給付の契約は、有期定期金として算出した金額と
    終身定期金として算出した金額の「いずれか多い金額」= max。 -/
def continuingAnnuityValue (termValue lifetimeValue : Money) : Money :=
  max termValue lifetimeValue

/-- 契約種別（3項 = false / 4項 = true）の caller-established Bool による選択。
    Bool は金額の算術ではなく、既に Money に解決された 2 値の選択にのみ使う。 -/
def annuityMinMaxValue (isContinuingContract : Bool) (termValue lifetimeValue : Money) : Money :=
  if isContinuingContract then continuingAnnuityValue termValue lifetimeValue
  else conditionalAnnuityValue termValue lifetimeValue

-- ==== verified facts about the model (model consistency only) ====

theorem lumpSumPaymentAmount_eq (amount : Money) : lumpSumPaymentAmount amount = amount := rfl

theorem lumpSumPaymentAmount_pos {amount : Money} (h : 0 < amount) :
    0 < lumpSumPaymentAmount amount := by
  simpa [lumpSumPaymentAmount] using h

theorem conditionalAnnuityValue_eq (t l : Money) :
    conditionalAnnuityValue t l = min t l := rfl

theorem continuingAnnuityValue_eq (t l : Money) :
    continuingAnnuityValue t l = max t l := rfl

theorem conditionalAnnuityValue_le_left (t l : Money) : conditionalAnnuityValue t l ≤ t := by
  simpa [conditionalAnnuityValue] using (Nat.min_le_left t l)

theorem conditionalAnnuityValue_le_right (t l : Money) : conditionalAnnuityValue t l ≤ l := by
  simpa [conditionalAnnuityValue] using (Nat.min_le_right t l)

theorem le_continuingAnnuityValue_left (t l : Money) : t ≤ continuingAnnuityValue t l := by
  simpa [continuingAnnuityValue] using (Nat.le_max_left t l)

theorem le_continuingAnnuityValue_right (t l : Money) : l ≤ continuingAnnuityValue t l := by
  simpa [continuingAnnuityValue] using (Nat.le_max_right t l)

/-- 3項の「少ない金額」は常に 4項の「多い金額」以下。 -/
theorem conditional_le_continuing (t l : Money) :
    conditionalAnnuityValue t l ≤ continuingAnnuityValue t l := by
  calc
    conditionalAnnuityValue t l = min t l := rfl
    _ ≤ t := Nat.min_le_left t l
    _ ≤ max t l := Nat.le_max_left t l
    _ = continuingAnnuityValue t l := rfl

/-- positivity: 両算出額が正なら min / max も正。 -/
theorem conditionalAnnuityValue_pos {t l : Money} (ht : 0 < t) (hl : 0 < l) :
    0 < conditionalAnnuityValue t l := by
  simpa [conditionalAnnuityValue] using ((Nat.lt_min).2 ⟨ht, hl⟩)

theorem continuingAnnuityValue_pos {t l : Money} (ht : 0 < t) (_hl : 0 < l) :
    0 < continuingAnnuityValue t l := by
  simpa [continuingAnnuityValue] using (Nat.lt_of_lt_of_le ht (Nat.le_max_left t l))

theorem annuityMinMaxValue_pos (b : Bool) {t l : Money} (ht : 0 < t) (hl : 0 < l) :
    0 < annuityMinMaxValue b t l := by
  cases b with
  | false => simpa [annuityMinMaxValue, conditionalAnnuityValue] using ((Nat.lt_min).2 ⟨ht, hl⟩)
  | true => simpa [annuityMinMaxValue, continuingAnnuityValue] using
      (Nat.lt_of_lt_of_le ht (Nat.le_max_left t l))

theorem annuityMinMaxValue_false (t l : Money) :
    annuityMinMaxValue false t l = conditionalAnnuityValue t l := rfl

theorem annuityMinMaxValue_true (t l : Money) :
    annuityMinMaxValue true t l = continuingAnnuityValue t l := rfl

-- ==== kernel-decided smoke checks ====

example : lumpSumPaymentAmount 0 = 0 := by decide
example : lumpSumPaymentAmount 12_345 = 12_345 := by decide
example : conditionalAnnuityValue 3 7 = 3 := by decide
example : conditionalAnnuityValue 7 3 = 3 := by decide
example : conditionalAnnuityValue 5 5 = 5 := by decide
example : conditionalAnnuityValue 0 5 = 0 := by decide
example : continuingAnnuityValue 3 7 = 7 := by decide
example : continuingAnnuityValue 7 3 = 7 := by decide
example : continuingAnnuityValue 5 5 = 5 := by decide
example : continuingAnnuityValue 0 5 = 5 := by decide
example : annuityMinMaxValue false 3 7 = 3 := by decide
example : annuityMinMaxValue true 3 7 = 7 := by decide

end JapanTaxLaw.InheritanceAnnuityMinMax
