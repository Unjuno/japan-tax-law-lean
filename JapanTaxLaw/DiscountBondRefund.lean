import JapanTaxLaw.TaxFinance

/-!
# DiscountBondRefund — 租税特別措置法施行令 art. 26の12（繰上償還等の場合の所得税の還付）bounded L4 モデル

Source (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json
  (租税特別措置法施行令; Article Num 26_12, normalized leaf text 747 chars)

担当範囲原文（一字も誤らず転記・正規化済み・UTF-8、全角空白 U+3000 なし、747 文字）:

  （繰上償還等の場合の所得税の還付）第二十六条の十二法第四十一条の十二第五項の規定により還付する所得税の額は、割引債の券面金額から償還金額（買入消却が行われる場合には、その買入金額。以下この項において同じ。）を控除した金額（当該割引債が外国法人が国外において発行したものであるときは、次に掲げる金額）に、当該割引債の発行の際に同条第三項の規定により当該割引債に係る償還差益について徴収された所得税の税率を乗じて計算した金額とする。一所得税法等の一部を改正する法律（平成二十六年法律第十号）第三条の規定による改正前の法人税法（ロ及び次号において「平成二十六年旧法人税法」という。）第百四十一条第一号に掲げる外国法人が国外において発行した割引債の券面金額から償還金額を控除した金額にイに掲げる金額のうちにロに掲げる金額の占める割合を乗じて計算した金額イ当該割引債の社債発行差金ロイに掲げる金額のうち当該外国法人の平成二十六年旧法人税法第百四十一条第一号に規定する事業を行う一定の場所を通じて国内において行う事業に帰せられる部分の金額二平成二十六年旧法人税法第百四十一条第二号又は第三号に掲げる外国法人が国外において発行した割引債の券面金額から償還金額を控除した金額にイに掲げる金額のうちにロに掲げる金額の占める割合を乗じて計算した金額イ当該割引債の社債発行差金ロイに掲げる金額のうちこれらの外国法人の平成二十六年旧法人税法第百四十一条第二号又は第三号に規定する事業に帰せられる部分の金額２法第四十一条の十二第五項の規定による還付は、同項に規定する償還の際、還付する。この場合において、当該還付をする金額は、同条第三項又は所得税法第百八十一条若しくは第二百十二条の規定により納付すべき金額から控除する。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized
leaf text, doc-comments only; 各 needle は U+3000 を含まず、pinned JSON の当該条
正規化テキスト（747 文字）中に先頭 0 / 149 / 288 / 372 / 640 文字目で出现）:

  N1「（繰上償還等の場合の所得税の還付）第二十六条の十二法第四十一条の十二第五項の規定により還付する所得税の額は、割引債の券面金額から償還金額（買入消却が行われる場合には、その買入金額。以下この項において同じ。）を控除した金額」
  N2「に、当該割引債の発行の際に同条第三項の規定により当該割引債に係る償還差益について徴収された所得税の税率を乗じて計算した金額とする。」
  N3「第百四十一条第一号に掲げる外国法人が国外において発行した割引債の券面金額から償還金額を控除した金額にイに掲げる金額のうちにロに掲げる金額の占める割合を乗じて計算した金額」
  N4「イ当該割引債の社債発行差金ロイに掲げる金額のうち当該外国法人の平成二十六年旧法人税法第百四十一条第一号に規定する事業を行う一定の場所を通じて国内において行う事業に帰せられる部分の金額」
  N5「２法第四十一条の十二第五項の規定による還付は、同項に規定する償還の際、還付する。この場合において、当該還付をする金額は、同条第三項又は所得税法第百八十一条若しくは第二百十二条の規定により納付すべき金額から控除する。」

Modelled (only the explicit statutory arithmetic):

  * 本則（内国発行等の割引債）:

      discountBondRefund faceAmount redemptionAmount withholdingRate
        = withholdingRate.applyFloor (faceAmount - redemptionAmount)

    原文「割引債の券面金額から償還金額…を控除した金額…に、…徴収された
    所得税の税率を乗じて計算した金額」。Nat 減算は saturating であり、
    券面金額 ≤ 償還金額なら 0。税率は `TaxRate.applyFloor`（切り捨て）で適用し、
    税率そのもの（num/den と発行時に徴収済みであること）は caller-established。

  * 外国法人が国外発行した割引債（一号・二号）:

      foreignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart
        = (faceAmount - redemptionAmount) * domesticPart / issuanceDiscount

    原文「券面金額から償還金額を控除した金額にイに掲げる金額のうちにロに掲げる
    金額の占める割合を乗じて計算した金額」。イ = 社債発行差金
    （`issuanceDiscount`）、ロ = 国内帰属部分 (`domesticPart`)。割合は
    `domesticPart / issuanceDiscount` だが、整数除算の精度を保つため
    乗じてから除する形式で定式化する（他モジュールの按分と同一慣例）。
    Nat 除算の切り捨て、分母 0 → 0（安全版）、券面 ≤ 償還なら 0。

      foreignBondRefund faceAmount redemptionAmount issuanceDiscount domesticPart rate
        = rate.applyFloor (foreignBondBase ...)

    原文の括弧内（外国法人分の金額）を本則の「券面−償還」の代わりに税率へ
    乗じる構造。一号・二号は同じ算術構造を持ち、区分（旧法人法第百四十一条
    第一号か第二号・第三号か）は caller-established で式に入れない。

Scope & honest boundaries:

  * 券面金額・償還金額・買入金額・税率・社債発行差金・国内帰属部分・
    一号／二号該当性・外国法人が国外発行したこと・買入消却が行われたことは
    すべて caller-established。`redemptionAmount` には原文
    「買入消却が行われる場合には、その買入金額」を適用済みの値（償還金額
    または買入金額）を渡す。Bool（区分）は金額式に入れず、Caller が
    本則／外国法人分および一号／二号の適用を選ぶ。
  * **平成二十六年旧法人税法第百四十一条第一号・第二号・第三号に掲げる
    外国法人の具体的認定は NOT MODELLED**。原文は一号・二号の適用範囲を
    「改正前の法人税法（平成二十六年旧法人税法）第百四十一条第○号に掲げる
    外国法人」としており、その認定（事業の種類、国内において行う事業に
    帰せられる部分の算定、一定の場所を通じて行う事業の判定）は本モジュールの
    外にある。架空の認定式を仮定せず、`domesticPart` は認定済みの金額として
    受け取るだけである。
  * 法第四十一条の十二第三項の税率そのものの算定、第五項の還付の成立、
    償還の際の還付手続、還付額を納付すべき金額から控除する処理、
    所得税法第百八十一条・第二百十二条の納付額は NOT MODELLED /
    caller-established。
  * 原文は「割合」を有理数で述べるが、本モデルは整数の乗除（切り捨て）で
    近似する。厳密な有理数割合・丸め規則の詳細は NOT MODELLED。
    分母零の退化ケースに法的意味があるとは主張しない。
  * 端数切り捨ては `TaxRate.applyFloor` および Nat 除算の慣例として明示する。
    入力の妥当性は caller が担保する。転記監査は fidelity-only であり
    法的正しさを保証しない。人間の法的レビューではない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.DiscountBondRefund

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 本則: 券面金額 − 償還金額（買入金額）× 徴収税率
-- ============================================================

/-- 本則: 割引債の券面金額から償還金額（買入消却なら買入金額、caller-established）
    を控除した金額に、発行の際に徴収された所得税の税率を乗じて計算した金額。
    Nat 減算は saturating、税率適用は `TaxRate.applyFloor`（切り捨て）。 -/
def discountBondRefund (faceAmount redemptionAmount : Money) (withholdingRate : TaxRate) : Money :=
  withholdingRate.applyFloor (faceAmount - redemptionAmount)

theorem discountBondRefund_eq (faceAmount redemptionAmount : Money) (withholdingRate : TaxRate) :
    discountBondRefund faceAmount redemptionAmount withholdingRate =
      withholdingRate.applyFloor (faceAmount - redemptionAmount) := rfl

/-- 券面金額 = 償還金額 → 0（saturating 減算と `applyFloor 0`）。 -/
theorem discountBondRefund_same (faceAmount : Money) (withholdingRate : TaxRate) :
    discountBondRefund faceAmount faceAmount withholdingRate = 0 := by
  unfold discountBondRefund TaxRate.applyFloor
  simp

/-- 償還金額 ≥ 券面金額 → 0（アンダーフローなし）。 -/
theorem discountBondRefund_zero_of_le (faceAmount redemptionAmount : Money)
    (withholdingRate : TaxRate) (h : faceAmount ≤ redemptionAmount) :
    discountBondRefund faceAmount redemptionAmount withholdingRate = 0 := by
  unfold discountBondRefund TaxRate.applyFloor
  simp [Nat.sub_eq_zero_of_le h]

/-- 税率の分子 0 → 0。 -/
theorem discountBondRefund_zero_rate (faceAmount redemptionAmount : Money)
    (withholdingRate : TaxRate) (h : withholdingRate.num = 0) :
    discountBondRefund faceAmount redemptionAmount withholdingRate = 0 := by
  unfold discountBondRefund TaxRate.applyFloor
  simp [h]

/-- 正数性: 税率の分母が「控除後金額 × 分子」以下なら還付額は正。 -/
theorem discountBondRefund_pos (faceAmount redemptionAmount : Money) (withholdingRate : TaxRate)
    (hLe : withholdingRate.den ≤ (faceAmount - redemptionAmount) * withholdingRate.num) :
    0 < discountBondRefund faceAmount redemptionAmount withholdingRate := by
  unfold discountBondRefund TaxRate.applyFloor
  exact Nat.div_pos hLe withholdingRate.den_pos

/-- 券面金額について単調非減少（償還金額・税率固定）。 -/
theorem discountBondRefund_mono_face {a b redemptionAmount : Money} (withholdingRate : TaxRate)
    (h : a ≤ b) :
    discountBondRefund a redemptionAmount withholdingRate ≤
      discountBondRefund b redemptionAmount withholdingRate := by
  unfold discountBondRefund TaxRate.applyFloor
  exact Nat.div_le_div_right (Nat.mul_le_mul_right withholdingRate.num (Nat.sub_le_sub_right h redemptionAmount))

-- smoke (kernel-decided)
example : discountBondRefund 1_000_000 900_000 (⟨10, 100, by decide⟩ : TaxRate) = 10_000 := by decide
example : discountBondRefund 1_000 1_000 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide
example : discountBondRefund 500 1_000 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide
example : discountBondRefund 1_001 1_000 (⟨20, 100, by decide⟩ : TaxRate) = 0 := by decide  -- 端数切り捨て
example : discountBondRefund 1_050 1_000 (⟨3, 10, by decide⟩ : TaxRate) = 15 := by decide

-- ============================================================
-- 外国法人が国外発行した割引債（一号・二号）: 案分の基盤
-- ============================================================

/-- 一号・二号の金額: 「券面金額 − 償還金額」に「イ（社債発行差金）のうち
    ロ（国内帰属部分）の占める割合」を乗じた金額。分母 0 → 0（安全版）、
    券面 ≤ 償還なら 0。一号・二号で算術は同じで、旧法人法の区分は
    caller-established（NOT MODELLED）。 -/
def foreignBondBase (faceAmount redemptionAmount issuanceDiscount domesticPart : Money) : Money :=
  (faceAmount - redemptionAmount) * domesticPart / issuanceDiscount

theorem foreignBondBase_eq (faceAmount redemptionAmount issuanceDiscount domesticPart : Money) :
    foreignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart =
      (faceAmount - redemptionAmount) * domesticPart / issuanceDiscount := rfl

/-- 分母（社債発行差金）0 → 0（Nat の `n / 0 = 0` による安全版）。 -/
theorem foreignBondBase_zero_denominator (faceAmount redemptionAmount domesticPart : Money) :
    foreignBondBase faceAmount redemptionAmount 0 domesticPart = 0 := by
  unfold foreignBondBase
  simp

/-- 券面金額 = 償還金額 → 0。 -/
theorem foreignBondBase_same (faceAmount issuanceDiscount domesticPart : Money) :
    foreignBondBase faceAmount faceAmount issuanceDiscount domesticPart = 0 := by
  unfold foreignBondBase
  simp

/-- 償還金額 ≥ 券面金額 → 0（saturating）。 -/
theorem foreignBondBase_zero_of_le (faceAmount redemptionAmount issuanceDiscount domesticPart : Money)
    (h : faceAmount ≤ redemptionAmount) :
    foreignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart = 0 := by
  unfold foreignBondBase
  simp [Nat.sub_eq_zero_of_le h]

/-- 国内帰属部分 0 → 0。 -/
theorem foreignBondBase_zero_domestic (faceAmount redemptionAmount issuanceDiscount : Money) :
    foreignBondBase faceAmount redemptionAmount issuanceDiscount 0 = 0 := by
  unfold foreignBondBase
  simp

/-- 国内帰属部分 = 社債発行差金（≠ 0）なら「券面 − 償還」そのもの。 -/
theorem foreignBondBase_domestic_full (faceAmount redemptionAmount issuanceDiscount : Money)
    (h : issuanceDiscount ≠ 0) :
    foreignBondBase faceAmount redemptionAmount issuanceDiscount issuanceDiscount =
      faceAmount - redemptionAmount := by
  unfold foreignBondBase
  exact Nat.mul_div_cancel (faceAmount - redemptionAmount) (Nat.pos_of_ne_zero h)

/-- 正数性: 分母が「(券面−償還) × 国内帰属部分」以下なら基盤は正。 -/
theorem foreignBondBase_pos (faceAmount redemptionAmount issuanceDiscount domesticPart : Money)
    (hLe : issuanceDiscount ≤ (faceAmount - redemptionAmount) * domesticPart)
    (hDen : 0 < issuanceDiscount) :
    0 < foreignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart := by
  unfold foreignBondBase
  exact Nat.div_pos hLe hDen

/-- 国内帰属部分について単調非減少（他引数固定）。 -/
theorem foreignBondBase_mono_domestic {a b : Money} (faceAmount redemptionAmount issuanceDiscount : Money)
    (h : a ≤ b) :
    foreignBondBase faceAmount redemptionAmount issuanceDiscount a ≤
      foreignBondBase faceAmount redemptionAmount issuanceDiscount b := by
  unfold foreignBondBase
  exact Nat.div_le_div_right (Nat.mul_le_mul_left (faceAmount - redemptionAmount) h)

-- smoke (kernel-decided)
example : foreignBondBase 1_000_000 900_000 100_000 25_000 = 25_000 := by decide
example : foreignBondBase 1_000 900 0 100 = 0 := by decide                -- 分母 0
example : foreignBondBase 1_000 900 100 100 = 100 := by decide            -- 割合 1
example : foreignBondBase 1_000 1_000 100 50 = 0 := by decide             -- 券面 = 償還
example : foreignBondBase 1_000 999 3 1 = 0 := by decide                  -- 端数切り捨て
example : foreignBondBase 1_000 991 7 3 = 3 := by decide

-- ============================================================
-- 外国法人分の還付額: 一号・二号の金額に徴収税率を乗じる
-- ============================================================

/-- 外国法人が国外発行した割引債の還付額: 原文の括弧内（一号・二号の金額）を
    本則の「券面−償還」の代わりに税率へ乗じる。 -/
def foreignBondRefund (faceAmount redemptionAmount issuanceDiscount domesticPart : Money)
    (withholdingRate : TaxRate) : Money :=
  withholdingRate.applyFloor
    (foreignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart)

theorem foreignBondRefund_eq (faceAmount redemptionAmount issuanceDiscount domesticPart : Money)
    (withholdingRate : TaxRate) :
    foreignBondRefund faceAmount redemptionAmount issuanceDiscount domesticPart withholdingRate =
      withholdingRate.applyFloor
        (foreignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart) := rfl

/-- 券面金額 = 償還金額 → 0。 -/
theorem foreignBondRefund_same (faceAmount issuanceDiscount domesticPart : Money)
    (withholdingRate : TaxRate) :
    foreignBondRefund faceAmount faceAmount issuanceDiscount domesticPart withholdingRate = 0 := by
  unfold foreignBondRefund TaxRate.applyFloor
  simp [foreignBondBase]

/-- 分母（社債発行差金）0 → 0。 -/
theorem foreignBondRefund_zero_denominator (faceAmount redemptionAmount domesticPart : Money)
    (withholdingRate : TaxRate) :
    foreignBondRefund faceAmount redemptionAmount 0 domesticPart withholdingRate = 0 := by
  unfold foreignBondRefund TaxRate.applyFloor
  simp [foreignBondBase]

/-- 国内帰属部分 = 社債発行差金（≠ 0）なら本則の還付額に一致。 -/
theorem foreignBondRefund_eq_discountBondRefund (faceAmount redemptionAmount issuanceDiscount : Money)
    (withholdingRate : TaxRate) (h : issuanceDiscount ≠ 0) :
    foreignBondRefund faceAmount redemptionAmount issuanceDiscount issuanceDiscount withholdingRate =
      discountBondRefund faceAmount redemptionAmount withholdingRate := by
  unfold foreignBondRefund discountBondRefund
  rw [foreignBondBase_domestic_full faceAmount redemptionAmount issuanceDiscount h]

/-- 正数性: 税率の分母が「基盤 × 分子」以下なら還付額は正
    （分母 > 0 よりこの仮定は基盤 > 0 を含意する）。 -/
theorem foreignBondRefund_pos (faceAmount redemptionAmount issuanceDiscount domesticPart : Money)
    (withholdingRate : TaxRate)
    (hLe : withholdingRate.den ≤
      foreignBondBase faceAmount redemptionAmount issuanceDiscount domesticPart * withholdingRate.num) :
    0 < foreignBondRefund faceAmount redemptionAmount issuanceDiscount domesticPart withholdingRate := by
  unfold foreignBondRefund TaxRate.applyFloor
  exact Nat.div_pos hLe withholdingRate.den_pos

-- smoke (kernel-decided)
example : foreignBondRefund 1_000_000 900_000 100_000 25_000 (⟨10, 100, by decide⟩ : TaxRate) = 2_500 := by decide
example : foreignBondRefund 1_000 1_000 100 50 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide
example : foreignBondRefund 1_000 900 0 100 (⟨10, 100, by decide⟩ : TaxRate) = 0 := by decide
example : foreignBondRefund 1_000 900 100 100 (⟨3, 10, by decide⟩ : TaxRate) = 30 := by decide

end JapanTaxLaw.DiscountBondRefund
