import JapanTaxLaw.TaxFinance

/-!
# InheritanceAnnuityMaxima — 相続税法 art. 24(1) 一号・二号・三号（定期金に関する権利の評価の max 構造）L4 モデル

Source (pinned):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json

担当範囲の原文（一字も誤らず、複利年金現価率の定義括弧は原文どおり）:

  （定期金に関する権利の評価）第二十四条定期金給付契約で当該契約に関する権利を
  取得した時において定期金給付事由が発生しているものに関する権利の価額は、
  次の各号に掲げる定期金又は一時金の区分に応じ、当該各号に定める金額による。
  一 有期定期金 「次に掲げる金額のうちいずれか多い金額」
     イ 解約返戻金の金額
     ロ 定期金に代えて一時金の給付を受けることができる場合には、当該一時金の金額
     ハ 残りの期間に応じ、一年当たりの平均額に、予定利率による複利年金現価率を乗じて得た金額
  二 無期定期金 「次に掲げる金額のうちいずれか多い金額」
     イ 解約返戻金の金額 / ロ 当該一時金の金額
     ハ 一年当たりの平均額を、予定利率で除して得た金額
  三 終身定期金 「次に掲げる金額のうちいずれか多い金額」
     イ 解約返戻金の金額 / ロ 当該一時金の金額
     ハ その目的とされた者に係る余命年数として政令で定めるものに応じ、
        一年当たりの平均額に、予定利率による複利年金現価率を乗じて得た金額

Computation (Money = Nat) — 三号とも「次に掲げる金額のうちいずれか多い金額」= 3 値の max:

  termAnnuityValue      s l a := max s (max l a)   -- 一号 有期定期金
  perpetualAnnuityValue s l d := max s (max l d)   -- 二号 無期定期金
  lifetimeAnnuityValue  s l a := max s (max l a)   -- 三号 終身定期金（max 構造は一号と同一、区分は異なる）

  s = イ解約返戻金, l = ロ一時金,
  a = ハ（平均額×複利年金現価率、計算済み Money）, d = ハ（平均額÷予定利率、計算済み Money）。

Scope & honest boundaries:

  * 各号の「いずれか多い金額」という max 構造のみをモデル化する。
  * 各入力（解約返戻金・一時金・ハの金額）はすべて caller-established Money。
  * 一時金を「給付を受けることができる場合」だけ選ぶ分岐は caller-established の
    Bool / Option で、金額式（max）には入れず選択にのみ使う
    （`selectLumpSum` / `*Opt` を参照。該当しない場合は caller が 0 を渡す）。
  * 一号・三号のハは「平均額×複利年金現価率」、二号のハは「平均額÷予定利率」だが、
    現価率・予定利率そのもの、および平均額との乗除は NOT MODELLED。
    複利年金現価率は財務省令で定める割合で原文に数式がなく、予定利率は契約依存の
    外部パラメータ、三号の余命年数は政令で定める外部パラメータであるため、
    呼び出し側が計算済みの Money を渡すものとする。
  * 第24条(2)〜(5)（死亡による給付終了、生存期間付き契約の「少ない金額」「多い金額」、
    契約によらない定期金への準用）は本スライスの対象外。
  * 転記監査は fidelity-only（原文 bytes との一致確認）。L4 のごく小さなスライスであり、
    完成・網羅を主張しない。
-/

namespace JapanTaxLaw.InheritanceAnnuityMaxima

open JapanTaxLaw.TaxFinance

-- ==== 一時金の選択分岐（Bool/Option は金額式に入れず選択のみに使う） ====

/-- 「定期金に代えて一時金の給付を受けることができる場合」の選択。
    `canReceive = false` のときは 0（一時金なし）を返す。
    Bool は max の中には現れず、Money に解決してから渡す。 -/
def selectLumpSum (canReceive : Bool) (amount : Money) : Money :=
  if canReceive then amount else 0

/-- Option 版（caller-established）。`none` は給付を受けることができない場合。 -/
def lumpSumAmount (lumpSum : Option Money) : Money :=
  match lumpSum with
  | none => 0
  | some v => v

-- ==== art. 24(1) 各号の金額（Money = Nat） ====

/-- 一号 有期定期金 — 「次に掲げる金額のうちいずれか多い金額」。
    イ解約返戻金・ロ一時金・ハ（一年当たりの平均額に予定利率による複利年金現価率を
    乗じて得た金額。残りの期間に応じる）の 3 値の max。各入力は caller-established。 -/
def termAnnuityValue (surrenderValue lumpSum annuityPresentValue : Money) : Money :=
  max surrenderValue (max lumpSum annuityPresentValue)

/-- 二号 無期定期金 — 「次に掲げる金額のうちいずれか多い金額」。
    イ解約返戻金・ロ一時金・ハ（一年当たりの平均額を予定利率で除して得た金額）
    の 3 値の max。一号とハの計算が異なる（現価率ではなく除算）点に注意。 -/
def perpetualAnnuityValue (surrenderValue lumpSum dividedByRate : Money) : Money :=
  max surrenderValue (max lumpSum dividedByRate)

/-- 三号 終身定期金 — 「次に掲げる金額のうちいずれか多い金額」。
    イ解約返戻金・ロ一時金・ハ（その目的とされた者に係る余命年数として政令で定める
    ものに応じ、一年当たりの平均額に予定利率による複利年金現価率を乗じて得た金額）
    の 3 値の max。max 構造は一号と同一だが、区分は「終身定期金」であり、
    ハの現価率は「余命年数」（政令で定める）に応じる点が一号（残りの期間）と異なる。 -/
def lifetimeAnnuityValue (surrenderValue lumpSum annuityPresentValue : Money) : Money :=
  max surrenderValue (max lumpSum annuityPresentValue)

/-- 一号の Option 版。一時金を `Option Money` として受け取り、max の外で解決する。 -/
def termAnnuityValueOpt (surrenderValue : Money) (lumpSum : Option Money)
    (annuityPresentValue : Money) : Money :=
  termAnnuityValue surrenderValue (lumpSumAmount lumpSum) annuityPresentValue

/-- 二号の Option 版。 -/
def perpetualAnnuityValueOpt (surrenderValue : Money) (lumpSum : Option Money)
    (dividedByRate : Money) : Money :=
  perpetualAnnuityValue surrenderValue (lumpSumAmount lumpSum) dividedByRate

/-- 三号の Option 版。 -/
def lifetimeAnnuityValueOpt (surrenderValue : Money) (lumpSum : Option Money)
    (annuityPresentValue : Money) : Money :=
  lifetimeAnnuityValue surrenderValue (lumpSumAmount lumpSum) annuityPresentValue

-- ==== verified facts（モデルの性質のみ。法的意味を主張しない） ====

theorem termAnnuityValue_eq (s l a : Money) :
    termAnnuityValue s l a = max s (max l a) := rfl

theorem perpetualAnnuityValue_eq (s l d : Money) :
    perpetualAnnuityValue s l d = max s (max l d) := rfl

theorem lifetimeAnnuityValue_eq (s l a : Money) :
    lifetimeAnnuityValue s l a = max s (max l a) := rfl

/-- positivity: 各号の価額はいずれの構成金額以上（max の性质）。 -/
theorem termAnnuityValue_ge_surrender (s l a : Money) : s ≤ termAnnuityValue s l a := by
  unfold termAnnuityValue
  exact Nat.le_max_left _ _

theorem termAnnuityValue_ge_lumpSum (s l a : Money) : l ≤ termAnnuityValue s l a := by
  unfold termAnnuityValue
  exact Nat.le_trans (Nat.le_max_left l a) (Nat.le_max_right s (max l a))

theorem termAnnuityValue_ge_annuity (s l a : Money) : a ≤ termAnnuityValue s l a := by
  unfold termAnnuityValue
  exact Nat.le_trans (Nat.le_max_right l a) (Nat.le_max_right s (max l a))

theorem perpetualAnnuityValue_ge_surrender (s l d : Money) : s ≤ perpetualAnnuityValue s l d := by
  unfold perpetualAnnuityValue
  exact Nat.le_max_left _ _

theorem perpetualAnnuityValue_ge_lumpSum (s l d : Money) : l ≤ perpetualAnnuityValue s l d := by
  unfold perpetualAnnuityValue
  exact Nat.le_trans (Nat.le_max_left l d) (Nat.le_max_right s (max l d))

theorem perpetualAnnuityValue_ge_divided (s l d : Money) : d ≤ perpetualAnnuityValue s l d := by
  unfold perpetualAnnuityValue
  exact Nat.le_trans (Nat.le_max_right l d) (Nat.le_max_right s (max l d))

theorem lifetimeAnnuityValue_ge_surrender (s l a : Money) : s ≤ lifetimeAnnuityValue s l a := by
  unfold lifetimeAnnuityValue
  exact Nat.le_max_left _ _

theorem lifetimeAnnuityValue_ge_lumpSum (s l a : Money) : l ≤ lifetimeAnnuityValue s l a := by
  unfold lifetimeAnnuityValue
  exact Nat.le_trans (Nat.le_max_left l a) (Nat.le_max_right s (max l a))

theorem lifetimeAnnuityValue_ge_annuity (s l a : Money) : a ≤ lifetimeAnnuityValue s l a := by
  unfold lifetimeAnnuityValue
  exact Nat.le_trans (Nat.le_max_right l a) (Nat.le_max_right s (max l a))

/-- 一時金選択の性质。Bool/Option は 0 または元の金額に解決される。 -/
theorem selectLumpSum_false (amount : Money) : selectLumpSum false amount = 0 := rfl
theorem selectLumpSum_true (amount : Money) : selectLumpSum true amount = amount := rfl
theorem lumpSumAmount_none : lumpSumAmount none = 0 := rfl
theorem lumpSumAmount_some (v : Money) : lumpSumAmount (some v) = v := rfl

-- ==== kernel-decided smoke checks（各入力の大小パターン・境界 0） ====

example : selectLumpSum false 100 = 0 := by decide
example : selectLumpSum true 100 = 100 := by decide
example : lumpSumAmount (none : Option Money) = 0 := by decide
example : lumpSumAmount (some 100) = 100 := by decide

-- 一号: イ / ロ / ハ がそれぞれ最大になるケース
example : termAnnuityValue 30 20 10 = 30 := by decide
example : termAnnuityValue 10 30 20 = 30 := by decide
example : termAnnuityValue 10 20 30 = 30 := by decide
-- 同値・境界
example : termAnnuityValue 20 20 20 = 20 := by decide
example : termAnnuityValue 0 0 0 = 0 := by decide
example : termAnnuityValue 0 5 5 = 5 := by decide
example : termAnnuityValue 5 0 5 = 5 := by decide
-- Option 版
example : termAnnuityValueOpt 10 (none : Option Money) 30 = 30 := by decide
example : termAnnuityValueOpt 10 (some 50) 30 = 50 := by decide

-- 二号
example : perpetualAnnuityValue 30 20 10 = 30 := by decide
example : perpetualAnnuityValue 10 30 20 = 30 := by decide
example : perpetualAnnuityValue 10 20 30 = 30 := by decide
example : perpetualAnnuityValue 0 0 0 = 0 := by decide
example : perpetualAnnuityValueOpt 10 (none : Option Money) 30 = 30 := by decide
example : perpetualAnnuityValueOpt 10 (some 50) 30 = 50 := by decide

-- 三号
example : lifetimeAnnuityValue 30 20 10 = 30 := by decide
example : lifetimeAnnuityValue 10 30 20 = 30 := by decide
example : lifetimeAnnuityValue 10 20 30 = 30 := by decide
example : lifetimeAnnuityValue 0 0 0 = 0 := by decide
example : lifetimeAnnuityValueOpt 10 (none : Option Money) 30 = 30 := by decide
example : lifetimeAnnuityValueOpt 10 (some 50) 30 = 50 := by decide

end JapanTaxLaw.InheritanceAnnuityMaxima
