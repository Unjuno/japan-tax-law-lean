import JapanTaxLaw.TaxFinance

/-!
# LocalTaxOfficeApportionment — 地方税法施行令 第五十六条の五十（事業所等が複数市町村にまたがる場合の課税標準の特例）の bounded L4 モデル

Sources (pinned):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 地方税法施行令)

担当範囲原文（一字も誤らず転記・正規化済み・UTF-8、全角空白 U+3000 なし、336 文字）:

  （事業所等が指定都市等とその他の市町村とにわたつて所在する場合等における課税標準の特例）第五十六条の五十事業所等が一の指定都市等の区域とその他の市町村の区域とにわたつて所在する場合における当該事業所等において行われる事業に対して当該指定都市等が課する事業所税に係る法第七百一条の四十第一項及び第二項の規定の適用については、当該事業所等に係る事業所床面積は、当該事業所等のうち当該指定都市等の区域内に所在する部分に係る事業所床面積（以下この条において「指定都市等所在部分の事業所床面積」という。）に相当する面積とし、当該事業所等に係る従業者給与総額は、当該従業者給与総額に当該指定都市等所在部分の事業所床面積の当該事業所等に係る事業所床面積に対する割合を乗じて得た額とする。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only; 各 needle は原文・pinned JSON の正規化テキストで出現回数 1）:

  N1「（事業所等が指定都市等とその他の市町村とにわたつて所在する場合等における課税標準の特例）第五十六条の五十事業所等が一の指定都市等の区域とその他の市町村の区域とにわたつて所在する場合における当該事業所等において行」
  N2「事業所等において行われる事業に対して当該指定都市等が課する事業所税に係る法第七百一条の四十第一項及び第二項の規定の適用については、当該事業所等に係る事業所床面積は、当該事業所等のうち当該指定都市等の区域内に所」
  N3「定都市等の区域内に所在する部分に係る事業所床面積（以下この条において「指定都市等所在部分の事業所床面積」という。）に相当する面積とし、当該事業所等に係る従業者給与総額は、当該従業者給与総額に当該指定都市等所在部」
  N4「在部分の事業所床面積」という。）に相当する面積とし、当該事業所等に係る従業者給与総額は、当該従業者給与総額に当該指定都市等所在部分の事業所床面積の当該事業所等に係る事業所床面積に対する割合を乗じて得た額とする。」

Modelled (only the explicit statutory arithmetic):

  * 按分共通 `apportion base numerator denominator = base * numerator / denominator`。
    Nat の除算は `n / 0 = 0` なので分母零でも停止し 0 を返す（安全版を兼ねる）。
  * 「指定都市等所在部分の事業所床面積の当該事業所等に係る事業所床面積に対する割合」を
    分子/分母ペア `(designatedCityArea, totalArea)` で表現する（`designatedCityAreaRatio`）。
  * 従業者給与総額の按分:
      `apportionedEmployeeSalary totalSalary designatedCityArea totalArea =
         apportion totalSalary designatedCityArea totalArea`
    すなわち `総給与額 × 指定都市等所在部分床面積 / 全事業所床面積`。
    割合は分子/分母ペアで表現し、全事業所床面積 = 0 なら 0（算出不能ケースのモデル規約）。
  * 事業所床面積の読み替え:
      `designatedCityFloorArea designatedCityArea = designatedCityArea`
    原文「当該事業所等に係る事業所床面積は、…指定都市等所在部分の事業所床面積に相当する面積とし」
    を定数的な同一値（reading replacement）として記録する。算術ではない。

Scope & honest boundaries:

  * 事業所床面積・指定都市等所在部分の事業所床面積・従業者給与総額は **caller-established**。
    面積・給与額の認定、指定都市等との区域判定、事業所等の該当性判定は本モジュールの外で行い、
    Bool は算定式に入れない。
  * 原文は按分の割合を示し端数規定を持たない。Money = Nat の除算による**切り捨て**を
    丸め規則として明示する（他モジュールの applyFloor と同一慣例）。解釈を保証しない。
  * 「法第七百一条の四十第一項及び第二項の規定の適用については…」という読み替えて適用する
    手続指定そのもの、および法側の課税標準の算定構造は **caller-established / NOT MODELLED**。
    本モジュールがモデル化するのは明示された按分算術と面積の同一値読み替えのみである。
  * totalArea = 0 / designatedCityArea = 0 の退化ケースに法的意味があるとは主張しない。
    入力の妥当性（分母が正であること、部分面積が全面積以下であること）は caller が担保する。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.LocalTaxOfficeApportionment

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 按分共通
-- ============================================================

/-- 按分共通: `base * numerator / denominator`（切り捨て）。
    Nat 除算の定義により `denominator = 0` のとき 0 を返すため、分母零でも安全。 -/
def apportion (base numerator denominator : Money) : Money :=
  base * numerator / denominator

theorem apportion_eq (base numerator denominator : Money) :
    apportion base numerator denominator = base * numerator / denominator := rfl

/-- 分母零 → 0（Nat の `n / 0 = 0` による安全版）。 -/
theorem apportion_zero_denominator (base numerator : Money) :
    apportion base numerator 0 = 0 := by
  unfold apportion
  simp

/-- 分子零 → 0。 -/
theorem apportion_zero_numerator (base denominator : Money) :
    apportion base 0 denominator = 0 := by
  unfold apportion
  simp

/-- 按分 1:1（base = numerator = denominator > 0）→ base。 -/
theorem apportion_one_to_one (base : Money) (h : base ≠ 0) :
    apportion base base base = base := by
  unfold apportion
  exact Nat.mul_div_cancel base (Nat.pos_of_ne_zero h)

-- ============================================================
-- 第五十六条の五十 — 指定都市等所在部分の割合と従業者給与総額の按分
-- ============================================================

/-- 第五十六条の五十: 「指定都市等所在部分の事業所床面積の当該事業所等に係る事業所床面積
    に対する割合」を分子/分母ペアで表現したもの。
    分子 = 指定都市等所在部分の事業所床面積、分母 = 全事業所床面積。 -/
def designatedCityAreaRatio (designatedCityArea totalArea : Money) : Money × Money :=
  (designatedCityArea, totalArea)

/-- 第五十六条の五十: 「当該事業所等に係る事業所床面積は、…指定都市等所在部分の事業所床面積に
    相当する面積とし」の読み替え。指定都市等が課する事業所税については事業所床面積を
    部分面積そのものとする（定数的な同一値、算術ではない）。 -/
def designatedCityFloorArea (designatedCityArea : Money) : Money :=
  designatedCityArea

theorem designatedCityFloorArea_eq (designatedCityArea : Money) :
    designatedCityFloorArea designatedCityArea = designatedCityArea := rfl

/-- 第五十六条の五十: 指定都市等が課する事業所税の従業者給与総額 =
    総給与額 × (指定都市等所在部分の事業所床面積 / 全事業所床面積)（切り捨て）。
    総給与額・各床面積は caller-established。全事業所床面積 = 0 なら 0（モデル規約）。 -/
def apportionedEmployeeSalary (totalSalary designatedCityArea totalArea : Money) : Money :=
  apportion totalSalary designatedCityArea totalArea

theorem apportionedEmployeeSalary_eq
    (totalSalary designatedCityArea totalArea : Money) :
    apportionedEmployeeSalary totalSalary designatedCityArea totalArea =
      totalSalary * designatedCityArea / totalArea := rfl

/-- 全事業所床面積 = 0 の退化ケース → 0。 -/
theorem apportionedEmployeeSalary_zero_totalArea (totalSalary designatedCityArea : Money) :
    apportionedEmployeeSalary totalSalary designatedCityArea 0 = 0 := by
  unfold apportionedEmployeeSalary apportion
  simp

/-- 指定都市等所在部分の事業所床面積 = 0 → 0。 -/
theorem apportionedEmployeeSalary_zero_designatedCityArea (totalSalary totalArea : Money) :
    apportionedEmployeeSalary totalSalary 0 totalArea = 0 := by
  unfold apportionedEmployeeSalary apportion
  simp

/-- 全体が指定都市等区域内（部分面積 = 全面積 > 0）なら、按分後も総給与額に等しい。 -/
theorem apportionedEmployeeSalary_full (totalSalary totalArea : Money)
    (h : totalArea ≠ 0) :
    apportionedEmployeeSalary totalSalary totalArea totalArea = totalSalary := by
  unfold apportionedEmployeeSalary apportion
  exact Nat.mul_div_cancel totalSalary (Nat.pos_of_ne_zero h)

/-- 全面積が固定なら、按分後の給与額は指定都市等所在部分の床面積について単調非減少。 -/
theorem apportionedEmployeeSalary_mono {a b totalSalary totalArea : Money} (h : a ≤ b) :
    apportionedEmployeeSalary totalSalary a totalArea ≤
      apportionedEmployeeSalary totalSalary b totalArea := by
  unfold apportionedEmployeeSalary apportion
  exact Nat.div_le_div_right (Nat.mul_le_mul_left _ h)

-- ============================================================
-- kernel-decided smoke checks
-- ============================================================

-- apportion: 1:1 / 零 / 分母零 / 端数切り捨て
example : apportion 100 100 100 = 100 := by decide
example : apportion 1_000_000 250_000 1_000_000 = 250_000 := by decide
example : apportion 10 7 3 = 23 := by decide
example : apportion 10 0 3 = 0 := by decide
example : apportion 10 3 0 = 0 := by decide

-- designatedCityAreaRatio / designatedCityFloorArea
example : designatedCityAreaRatio 3_000 10_000 = (3_000, 10_000) := by decide
example : designatedCityFloorArea 3_000 = 3_000 := by decide

-- apportionedEmployeeSalary: 端数切り捨て / 1:1 / 分母零 / 按分
example : apportionedEmployeeSalary 10_000_000 3_000 10_000 = 3_000_000 := by decide
example : apportionedEmployeeSalary 10_000_000 1 3 = 3_333_333 := by decide
example : apportionedEmployeeSalary 10_000_000 10_000 10_000 = 10_000_000 := by decide
example : apportionedEmployeeSalary 10_000_000 0 10_000 = 0 := by decide
example : apportionedEmployeeSalary 5 3 0 = 0 := by decide

end JapanTaxLaw.LocalTaxOfficeApportionment
