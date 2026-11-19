import JapanTaxLaw.TaxFinance

/-!
# IntermediateSurchargeRefund — 地方税法施行令 art. 26（中間納付額に係る延滞金の還付）bounded L4 モデル

Source (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 地方税法施行令)

担当範囲原文（一字も誤らず転記・正規化済み・UTF-8、全角空白 U+3000 なし、471 文字）:

  （中間納付額に係る延滞金の還付）第二十六条道府県知事は、前条の規定によつて中間納付額を還付する場合において、当該中間納付額について納付された法第七十二条の四十四又は第七十二条の四十五の規定による延滞金があるときは、当該延滞金のうち還付すべき中間納付額に対応するものとして、当該中間納付額について納付された延滞金額に当該中間納付額のうち前条第一項の規定により還付すべき金額（次条第一項第一号又は第二号の規定により充当される金額があるときは、これを控除した金額）の占める割合を乗じて得た金額を併せて還付する。ただし、中間納付額が分割して納付されている場合には、第一号に掲げる金額から第二号に掲げる金額を控除した金額とする。一当該中間納付額について納付された延滞金額二当該中間納付額のうち納付の順序に従い当該中間納付額に係る事業年度の法第七十二条の二十八第二項の申告書に記載された事業税額（次条第一項第一号の規定により充当される金額があるときは、これを加算した金額）に達するまで順次求めた各中間納付額につき、法の規定により計算される延滞金額の合計額

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized
leaf text, doc-comments only; 各 needle は U+3000 を含まず、pinned JSON の当該条
正規化テキスト（471 文字）中に先頭 0 / 107 / 252 / 309 文字目で出现）:

  N1「（中間納付額に係る延滞金の還付）第二十六条道府県知事は、前条の規定によつて中間納付額を還付する場合において、当該中間納付額について納付された法第七十二条の四十四又は第七十二条の四十五の規定による延滞金があるときは、」
  N2「当該延滞金のうち還付すべき中間納付額に対応するものとして、当該中間納付額について納付された延滞金額に当該中間納付額のうち前条第一項の規定により還付すべき金額（次条第一項第一号又は第二号の規定により充当される金額があるときは、これを控除した金額）の占める割合を乗じて得た金額を併せて還付する。」
  N3「ただし、中間納付額が分割して納付されている場合には、第一号に掲げる金額から第二号に掲げる金額を控除した金額とする。」
  N4「一当該中間納付額について納付された延滞金額二当該中間納付額のうち納付の順序に従い当該中間納付額に係る事業年度の法第七十二条の二十八第二項の申告書に記載された事業税額（次条第一項第一号の規定により充当される金額があるときは、これを加算した金額）に達するまで順次求めた各中間納付額につき、法の規定により計算される延滞金額の合計額」

Modelled (only the explicit statutory arithmetic):

  * 本則の按分:

      surchargeRefund surchargePaid refundAmount intermediateTotal
        = surchargePaid * refundAmount / intermediateTotal

    原文「当該中間納付額について納付された延滞金額に当該中間納付額のうち
    前条第一項の規定により還付すべき金額…の占める割合を乗じて得た金額」
    を 分子/分母ペア (refundAmount, intermediateTotal) の按分として写す。
    Nat 除算の定義により intermediateTotal = 0 なら 0 を返す（安全版）。
    切り捨てを丸め規則として明示する（他モジュールの applyFloor と同一慣例）。

  * ただし書（分割納付）:

      splitRefund amount1 amount2 = amount1 - amount2

    原文「第一号に掲げる金額から第二号に掲げる金額を控除した金額とする」を
    saturating Nat 減算として写す。amount2 > amount1 なら 0。

Scope & honest boundaries:

  * 延滞金額・還付すべき金額・中間納付額・充当される金額・分割納付かどうかの区分は
    **caller-established**。`surchargeRefund` の `refundAmount` は原文の
    「充当される金額があるときは、これを控除した金額」を適用済みの値として受け取る。
    区分（Bool）は金額式に入れず、Caller が本則/ただし書の適用を選ぶ。
  * **第二号の「法の規定により計算される延滞金額の合計額」は NOT MODELLED**。
    原文は各中間納付額につき法の規定により計算される延滞金額の合計額を要求するが、
    その算定（法第七十二条の二十八第二項の申告書に記載された事業税額に達するまで
    順次求める手続、ならびに各期の延滞金額の計算）は本モジュールの外にあり、
    架空の算定式を仮定しない。`splitRefund` の `amount2` はその合計額を
    caller-established な入力として受け取るだけである。
  * 前条（art. 25）の中間納付額還付の成立、次条（art. 27）の充当の成立、
    法第七十二条の四十四/四十五の延滞金の発生・額そのものも NOT MODELLED。
  * 端数切り捨て・分母零の退化ケースに法的意味があるとは主張しない。
    入力の妥当性は caller が担保する。転記監査は fidelity-only であり
    法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.IntermediateSurchargeRefund

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 本則: 延滞金額の按分還付
-- ============================================================

/-- 本則: 当該中間納付額について納付された延滞金額に、還付すべき金額
    （充当額控除済み、caller-established）の占める割合を乗じて得た金額。
    `refundAmount / intermediateTotal` の代わりに
    `surchargePaid * refundAmount / intermediateTotal` として計算し、
    Nat 除算の切り捨てを丸め規則とする。分母零なら 0（モデル規約）。 -/
def surchargeRefund (surchargePaid refundAmount intermediateTotal : Money) : Money :=
  surchargePaid * refundAmount / intermediateTotal

theorem surchargeRefund_eq (surchargePaid refundAmount intermediateTotal : Money) :
    surchargeRefund surchargePaid refundAmount intermediateTotal =
      surchargePaid * refundAmount / intermediateTotal := rfl

/-- 分母零 → 0（Nat の `n / 0 = 0` による安全版）。 -/
theorem surchargeRefund_zero_denominator (surchargePaid refundAmount : Money) :
    surchargeRefund surchargePaid refundAmount 0 = 0 := by
  unfold surchargeRefund
  simp

/-- 還付すべき金額 0 → 0。 -/
theorem surchargeRefund_zero_refund (surchargePaid intermediateTotal : Money) :
    surchargeRefund surchargePaid 0 intermediateTotal = 0 := by
  unfold surchargeRefund
  simp

/-- 納付済延滞金額 0 → 0。 -/
theorem surchargeRefund_zero_surchargePaid (refundAmount intermediateTotal : Money) :
    surchargeRefund 0 refundAmount intermediateTotal = 0 := by
  unfold surchargeRefund
  simp

/-- 還付すべき金額が中間納付額全体（> 0）なら、納付済延滞金額そのもの。 -/
theorem surchargeRefund_full (surchargePaid intermediateTotal : Money)
    (h : intermediateTotal ≠ 0) :
    surchargeRefund surchargePaid intermediateTotal intermediateTotal = surchargePaid := by
  unfold surchargeRefund
  exact Nat.mul_div_cancel surchargePaid (Nat.pos_of_ne_zero h)

/-- 正数性: 分母が正で、分母が積以下なら還付額は正。 -/
theorem surchargeRefund_pos (surchargePaid refundAmount intermediateTotal : Money)
    (hT : 0 < intermediateTotal)
    (hLe : intermediateTotal ≤ surchargePaid * refundAmount) :
    0 < surchargeRefund surchargePaid refundAmount intermediateTotal := by
  unfold surchargeRefund
  exact Nat.div_pos hLe hT

/-- 分母・納付済延滞金額が固定なら、還付額について単調非減少。 -/
theorem surchargeRefund_mono {a b surchargePaid intermediateTotal : Money} (h : a ≤ b) :
    surchargeRefund surchargePaid a intermediateTotal ≤
      surchargeRefund surchargePaid b intermediateTotal := by
  unfold surchargeRefund
  exact Nat.div_le_div_right (Nat.mul_le_mul_left _ h)

/-- 還付額が中間納付額以下なら、還付延滞金額は納付済延滞金額以下。 -/
theorem surchargeRefund_le_surchargePaid (surchargePaid refundAmount intermediateTotal : Money)
    (h : refundAmount ≤ intermediateTotal) :
    surchargeRefund surchargePaid refundAmount intermediateTotal ≤ surchargePaid := by
  unfold surchargeRefund
  have hmul : surchargePaid * refundAmount ≤ surchargePaid * intermediateTotal :=
    Nat.mul_le_mul_left surchargePaid h
  -- (s * r) / t ≤ (s * t) / t = s  (t > 0)、t = 0 なら左辺も 0
  by_cases ht : intermediateTotal = 0
  · simp [ht]
  · have hdiv : surchargePaid * refundAmount / intermediateTotal ≤
        surchargePaid * intermediateTotal / intermediateTotal :=
      Nat.div_le_div_right hmul
    have hcancel : surchargePaid * intermediateTotal / intermediateTotal = surchargePaid :=
      Nat.mul_div_cancel surchargePaid (Nat.pos_of_ne_zero ht)
    simpa [hcancel] using hdiv

-- ============================================================
-- ただし書: 分割納付の控除
-- ============================================================

/-- ただし書: 第一号に掲げる金額から第二号に掲げる金額を控除した金額。
    第二号（法の規定により計算される延滞金額の合計額）の算定は NOT MODELLED
    であり、`amount2` は caller-established な入力として受け取る。
    saturating Nat 減算により、amount2 > amount1 なら 0。 -/
def splitRefund (amount1 amount2 : Money) : Money :=
  amount1 - amount2

theorem splitRefund_eq (amount1 amount2 : Money) :
    splitRefund amount1 amount2 = amount1 - amount2 := rfl

/-- amount1 ≤ amount2（控除額が第一号以上）→ 0（アンダーフローなし）。 -/
theorem splitRefund_zero_of_le (amount1 amount2 : Money) (h : amount1 ≤ amount2) :
    splitRefund amount1 amount2 = 0 := by
  unfold splitRefund
  exact Nat.sub_eq_zero_of_le h

/-- 正数性: 第一号が第二号より大きければ差は正。 -/
theorem splitRefund_pos_of_lt (amount1 amount2 : Money) (h : amount2 < amount1) :
    0 < splitRefund amount1 amount2 := by
  unfold splitRefund
  exact Nat.sub_pos_of_lt h

/-- 控除額 0 → 第一号そのもの。 -/
theorem splitRefund_zero_applied (amount1 : Money) :
    splitRefund amount1 0 = amount1 := by
  unfold splitRefund
  simp

/-- 差は第一号以下。 -/
theorem splitRefund_le (amount1 amount2 : Money) :
    splitRefund amount1 amount2 ≤ amount1 := by
  unfold splitRefund
  exact Nat.sub_le _ _

-- ============================================================
-- kernel-decided smoke checks
-- ============================================================

-- 本則: 1:1 / 分母零 / 還付額零 / 端数切り捨て
example : surchargeRefund 1_000 1_000 1_000 = 1_000 := by decide
example : surchargeRefund 1_000 300 0 = 0 := by decide
example : surchargeRefund 1_000 0 1_000 = 0 := by decide
example : surchargeRefund 0 300 1_000 = 0 := by decide
example : surchargeRefund 1_000 1 3 = 333 := by decide
example : surchargeRefund 12_345 3_000 10_000 = 3_703 := by decide

-- ただし書: 通常 / 第二号 > 第一号 で 0 / 第二号 0
example : splitRefund 5_000 2_000 = 3_000 := by decide
example : splitRefund 2_000 5_000 = 0 := by decide
example : splitRefund 0 1 = 0 := by decide
example : splitRefund 2_000 0 = 2_000 := by decide

end JapanTaxLaw.IntermediateSurchargeRefund
