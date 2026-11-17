import JapanTaxLaw.TaxFinance

/-!
# RegistryPropertyRightsFees — 登録免許税法 別表第一（二）四〜四の四の手数料モデル (W-W)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: reg_prop_B.txt（四〜四の四）

原文の各 fee string を読み、割合型は税率定数 `TaxRate ⟨X, 1000, …⟩` と税額関数
`base.applyFloor`（= 課税標準 × X / 1000、切り捨て）、定額型は `Money` 定数として
モデル化する。担当範囲の 4 権利はいずれも同一の手数料体系で、号ごとの差は権利名だけである。

  四    ダム使用権
  四の二 公共施設等運営権
  四の三 樹木採取権
  四の四 漁港水面施設運営権

各権利の 12 の fee string と本モジュールの対応:

  （一）設定の登録 ............ 権利の価額千分の一 ........ 1/1000
  （二）イ 相続・合併による移転 .. 権利の価額千分の一 ........ 1/1000
  （二）ロ その他の原因による移転 .. 権利の価額千分の五 ........ 5/1000
  （三）抵当権設定・処分制限等 .... 債権金額又は極度金額千分の四 .. 4/1000
  （四）イ 相続・合併による移転 .. 債権金額又は極度金額千分の一 .. 1/1000
  （四）ロ その他の原因による移転 .. 債権金額又は極度金額千分の二 .. 2/1000
  （五）根抵当権の一部譲渡等 ..... 共有者の数で極度金額を除した金額千分の二 .. 2/1000
  （六）抵当権の順位の変更 ...... 抵当権の件数一件につき千円 ... ¥1,000/件
  （七）イ 抵当権の信託 ......... 債権金額又は極度金額千分の二 .. 2/1000
  （七）ロ 抵当権以外の権利の信託 .. 権利の価額千分の一 ........ 1/1000
  （八）付記・仮・回復・更正／変更 .. 権利の件数一件につき千円 ... ¥1,000/件
  （九）登録の抹消 ............ 権利の件数一件につき千円 ... ¥1,000/件

同じ `X/1000` は率定数 1 本にまとめ、複数の号から参照する（各号の原文との対応は
下記 def の doc-comment に明記）。定額 3 種はすべて「一件につき千円」なので
各権利 1 本の `Money` 定数 `…PerCaseFee = 1000` にまとめる。

元の原文の注意点:

  * 四の二 公共施設等運営権の（二）イは「法人の合併による移転の登録」のみで、
    他の 3 権利の「相続又は法人の合併による移転の登録」と文言が異なる。
    いずれも率は 1/1000 で算術は同じ（この差は doc-comment に記録する）。
  * （三）（四）（五）（六）（七）イの文言は 4 権利で完全に同一（バイト一致）。
  * 担当範囲の直後の「五 工場財団、鉱業財団、…」「六」は本スライスの範囲外で
    モデル化しない（千分の二・五、千分の一・五、三万円、六千円等は対象外）。

Scope & honest boundaries:

  * 課税標準（「権利の価額」「債権金額又は極度金額」「一部譲渡又は分割後の
    共有者の数で極度金額を除して計算した金額」）は **caller-established**。
    本モデルは与えられた `base` に率を乗じる算術（および定額）のみを扱い、
    価額の算定・評価、共有者数での除算は一切行わない。
  * 登記／登録の該当性・原因判定（相続／法人の合併／その他、設定／移転／信託等）、
    件数、軽減・免税の適用可否は **caller-established** とし、Bool を金額計算式に
    入れない。定額も 1 件あたりの定数のみを与え、件数を掛ける Nat 掛け算は行わない。
  * 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「千分のX」で
    端数規定を持たないため、floor を per-law business data として採用した。
  * 割合型の税額は `base` が小さいと 0 になり得るため strict positivity は成り立たない。
    代わりに各率定数の `den_pos`（well-definedness）と定額定数の正性、各税額関数の
    smoke を付与する。
  * 別表第一の他の号・他の別表、登録免許税法全体（免税・軽減、納税義務者等）は
    **NOT YET COVERED**。pinned evidence は doc-comment のみで、各定理は実法的意味
    ではなくモデルの性質のみを主張する（誠実性の原則）。

本モジュールの def は 4 権利 × (率定数 4 + 定額 1 + 税額関数 4) = 36 本、
well-definedness 定理 4 権利 × (率 4 + 定額 1) = 20 本および単調性 1 本。
-/

namespace JapanTaxLaw.RegistryPropertyRightsFees

open JapanTaxLaw.TaxFinance

/-! ==================== 四 ダム使用権 ==================== -/

/-- ダム使用権（一）（二）イ（四）イ（七）ロ — 価額／債権金額千分の一 (1/1000)。 -/
def damThousandthRate : TaxRate := ⟨1, 1000, by decide⟩

/-- ダム使用権（二）ロ — ダム使用権の価額千分の五 (5/1000)。 -/
def damFiveThousandthsRate : TaxRate := ⟨5, 1000, by decide⟩

/-- ダム使用権（三） — 債権金額又は極度金額千分の四 (4/1000)。 -/
def damFourThousandthsRate : TaxRate := ⟨4, 1000, by decide⟩

/-- ダム使用権（四）ロ（五）（七）イ — 債権金額／極度金額／除算額千分の二 (2/1000)。 -/
def damTwoThousandthsRate : TaxRate := ⟨2, 1000, by decide⟩

/-- ダム使用権（六）（八）（九） — 一件につき千円 (¥1,000)。件数掛けは行わない。 -/
def damPerCaseFee : Money := 1_000

/-- ダム使用権（一）（二）イ（四）イ（七）ロの税額 = 課税標準 × 1/1000（切り捨て）。 -/
def damThousandthFee (base : Money) : Money := damThousandthRate.applyFloor base

/-- ダム使用権（二）ロの税額 = ダム使用権の価額 × 5/1000（切り捨て）。 -/
def damFiveThousandthsFee (base : Money) : Money := damFiveThousandthsRate.applyFloor base

/-- ダム使用権（三）の税額 = 債権金額又は極度金額 × 4/1000（切り捨て）。 -/
def damFourThousandthsFee (base : Money) : Money := damFourThousandthsRate.applyFloor base

/-- ダム使用権（四）ロ（五）（七）イの税額 = 課税標準 × 2/1000（切り捨て）。 -/
def damTwoThousandthsFee (base : Money) : Money := damTwoThousandthsRate.applyFloor base

/-! ==================== 四の二 公共施設等運営権 ==================== -/

/-- 公共施設等運営権（一）（二）イ（四）イ（七）ロ — 千分の一 (1/1000)。
    （二）イは原文「法人の合併による移転の登録」（相続を含まない）に注意。 -/
def pfcThousandthRate : TaxRate := ⟨1, 1000, by decide⟩

/-- 公共施設等運営権（二）ロ — 公共施設等運営権の価額千分の五 (5/1000)。 -/
def pfcFiveThousandthsRate : TaxRate := ⟨5, 1000, by decide⟩

/-- 公共施設等運営権（三） — 債権金額又は極度金額千分の四 (4/1000)。 -/
def pfcFourThousandthsRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 公共施設等運営権（四）ロ（五）（七）イ — 千分の二 (2/1000)。 -/
def pfcTwoThousandthsRate : TaxRate := ⟨2, 1000, by decide⟩

/-- 公共施設等運営権（六）（八）（九） — 一件につき千円 (¥1,000)。件数掛けは行わない。 -/
def pfcPerCaseFee : Money := 1_000

/-- 公共施設等運営権（一）（二）イ（四）イ（七）ロの税額 = 課税標準 × 1/1000。 -/
def pfcThousandthFee (base : Money) : Money := pfcThousandthRate.applyFloor base

/-- 公共施設等運営権（二）ロの税額 = 価額 × 5/1000（切り捨て）。 -/
def pfcFiveThousandthsFee (base : Money) : Money := pfcFiveThousandthsRate.applyFloor base

/-- 公共施設等運営権（三）の税額 = 債権金額又は極度金額 × 4/1000（切り捨て）。 -/
def pfcFourThousandthsFee (base : Money) : Money := pfcFourThousandthsRate.applyFloor base

/-- 公共施設等運営権（四）ロ（五）（七）イの税額 = 課税標準 × 2/1000（切り捨て）。 -/
def pfcTwoThousandthsFee (base : Money) : Money := pfcTwoThousandthsRate.applyFloor base

/-! ==================== 四の三 樹木採取権 ==================== -/

/-- 樹木採取権（一）（二）イ（四）イ（七）ロ — 千分の一 (1/1000)。 -/
def treeThousandthRate : TaxRate := ⟨1, 1000, by decide⟩

/-- 樹木採取権（二）ロ — 樹木採取権の価額千分の五 (5/1000)。 -/
def treeFiveThousandthsRate : TaxRate := ⟨5, 1000, by decide⟩

/-- 樹木採取権（三） — 債権金額又は極度金額千分の四 (4/1000)。 -/
def treeFourThousandthsRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 樹木採取権（四）ロ（五）（七）イ — 千分の二 (2/1000)。 -/
def treeTwoThousandthsRate : TaxRate := ⟨2, 1000, by decide⟩

/-- 樹木採取権（六）（八）（九） — 一件につき千円 (¥1,000)。件数掛けは行わない。 -/
def treePerCaseFee : Money := 1_000

/-- 樹木採取権（一）（二）イ（四）イ（七）ロの税額 = 課税標準 × 1/1000。 -/
def treeThousandthFee (base : Money) : Money := treeThousandthRate.applyFloor base

/-- 樹木採取権（二）ロの税額 = 価額 × 5/1000（切り捨て）。 -/
def treeFiveThousandthsFee (base : Money) : Money := treeFiveThousandthsRate.applyFloor base

/-- 樹木採取権（三）の税額 = 債権金額又は極度金額 × 4/1000（切り捨て）。 -/
def treeFourThousandthsFee (base : Money) : Money := treeFourThousandthsRate.applyFloor base

/-- 樹木採取権（四）ロ（五）（七）イの税額 = 課税標準 × 2/1000（切り捨て）。 -/
def treeTwoThousandthsFee (base : Money) : Money := treeTwoThousandthsRate.applyFloor base

/-! ==================== 四の四 漁港水面施設運営権 ==================== -/

/-- 漁港水面施設運営権（一）（二）イ（四）イ（七）ロ — 千分の一 (1/1000)。 -/
def portThousandthRate : TaxRate := ⟨1, 1000, by decide⟩

/-- 漁港水面施設運営権（二）ロ — 漁港水面施設運営権の価額千分の五 (5/1000)。 -/
def portFiveThousandthsRate : TaxRate := ⟨5, 1000, by decide⟩

/-- 漁港水面施設運営権（三） — 債権金額又は極度金額千分の四 (4/1000)。 -/
def portFourThousandthsRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 漁港水面施設運営権（四）ロ（五）（七）イ — 千分の二 (2/1000)。 -/
def portTwoThousandthsRate : TaxRate := ⟨2, 1000, by decide⟩

/-- 漁港水面施設運営権（六）（八）（九） — 一件につき千円 (¥1,000)。件数掛けは行わない。 -/
def portPerCaseFee : Money := 1_000

/-- 漁港水面施設運営権（一）（二）イ（四）イ（七）ロの税額 = 課税標準 × 1/1000。 -/
def portThousandthFee (base : Money) : Money := portThousandthRate.applyFloor base

/-- 漁港水面施設運営権（二）ロの税額 = 価額 × 5/1000（切り捨て）。 -/
def portFiveThousandthsFee (base : Money) : Money := portFiveThousandthsRate.applyFloor base

/-- 漁港水面施設運営権（三）の税額 = 債権金額又は極度金額 × 4/1000（切り捨て）。 -/
def portFourThousandthsFee (base : Money) : Money := portFourThousandthsRate.applyFloor base

/-- 漁港水面施設運営権（四）ロ（五）（七）イの税額 = 課税標準 × 2/1000（切り捨て）。 -/
def portTwoThousandthsFee (base : Money) : Money := portTwoThousandthsRate.applyFloor base

/-! ==================== well-definedness（positivity） ==================== -/

theorem damThousandthRate_den_pos : 0 < damThousandthRate.den := by decide
theorem damFiveThousandthsRate_den_pos : 0 < damFiveThousandthsRate.den := by decide
theorem damFourThousandthsRate_den_pos : 0 < damFourThousandthsRate.den := by decide
theorem damTwoThousandthsRate_den_pos : 0 < damTwoThousandthsRate.den := by decide
theorem damPerCaseFee_pos : damPerCaseFee > 0 := by decide

theorem pfcThousandthRate_den_pos : 0 < pfcThousandthRate.den := by decide
theorem pfcFiveThousandthsRate_den_pos : 0 < pfcFiveThousandthsRate.den := by decide
theorem pfcFourThousandthsRate_den_pos : 0 < pfcFourThousandthsRate.den := by decide
theorem pfcTwoThousandthsRate_den_pos : 0 < pfcTwoThousandthsRate.den := by decide
theorem pfcPerCaseFee_pos : pfcPerCaseFee > 0 := by decide

theorem treeThousandthRate_den_pos : 0 < treeThousandthRate.den := by decide
theorem treeFiveThousandthsRate_den_pos : 0 < treeFiveThousandthsRate.den := by decide
theorem treeFourThousandthsRate_den_pos : 0 < treeFourThousandthsRate.den := by decide
theorem treeTwoThousandthsRate_den_pos : 0 < treeTwoThousandthsRate.den := by decide
theorem treePerCaseFee_pos : treePerCaseFee > 0 := by decide

theorem portThousandthRate_den_pos : 0 < portThousandthRate.den := by decide
theorem portFiveThousandthsRate_den_pos : 0 < portFiveThousandthsRate.den := by decide
theorem portFourThousandthsRate_den_pos : 0 < portFourThousandthsRate.den := by decide
theorem portTwoThousandthsRate_den_pos : 0 < portTwoThousandthsRate.den := by decide
theorem portPerCaseFee_pos : portPerCaseFee > 0 := by decide

/-- 割合型手数料額は caller-established な課税標準について単調非減少。 -/
theorem rateFee_mono (rate : TaxRate) {a b : Money} (h : a ≤ b) :
    rate.applyFloor a ≤ rate.applyFloor b := by
  simp [TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right rate.num h)

/-! ==================== smoke（各 def、すべて kernel-decide） ==================== -/

-- 率定数: 分子・分母が原文どおり
example : damThousandthRate.num = 1 := by decide
example : damThousandthRate.den = 1000 := by decide
example : damFiveThousandthsRate.num = 5 := by decide
example : damFiveThousandthsRate.den = 1000 := by decide
example : damFourThousandthsRate.num = 4 := by decide
example : damFourThousandthsRate.den = 1000 := by decide
example : damTwoThousandthsRate.num = 2 := by decide
example : damTwoThousandthsRate.den = 1000 := by decide
example : pfcThousandthRate.num = 1 := by decide
example : pfcThousandthRate.den = 1000 := by decide
example : pfcFiveThousandthsRate.num = 5 := by decide
example : pfcFiveThousandthsRate.den = 1000 := by decide
example : pfcFourThousandthsRate.num = 4 := by decide
example : pfcFourThousandthsRate.den = 1000 := by decide
example : pfcTwoThousandthsRate.num = 2 := by decide
example : pfcTwoThousandthsRate.den = 1000 := by decide
example : treeThousandthRate.num = 1 := by decide
example : treeThousandthRate.den = 1000 := by decide
example : treeFiveThousandthsRate.num = 5 := by decide
example : treeFiveThousandthsRate.den = 1000 := by decide
example : treeFourThousandthsRate.num = 4 := by decide
example : treeFourThousandthsRate.den = 1000 := by decide
example : treeTwoThousandthsRate.num = 2 := by decide
example : treeTwoThousandthsRate.den = 1000 := by decide
example : portThousandthRate.num = 1 := by decide
example : portThousandthRate.den = 1000 := by decide
example : portFiveThousandthsRate.num = 5 := by decide
example : portFiveThousandthsRate.den = 1000 := by decide
example : portFourThousandthsRate.num = 4 := by decide
example : portFourThousandthsRate.den = 1000 := by decide
example : portTwoThousandthsRate.num = 2 := by decide
example : portTwoThousandthsRate.den = 1000 := by decide

-- 定額
example : damPerCaseFee = 1_000 := by decide
example : pfcPerCaseFee = 1_000 := by decide
example : treePerCaseFee = 1_000 := by decide
example : portPerCaseFee = 1_000 := by decide

-- 1/1000: 999→0, 1000→1, 12345→12, 1000000→1000
example : damThousandthFee 999 = 0 := by decide
example : damThousandthFee 1000 = 1 := by decide
example : damThousandthFee 12_345 = 12 := by decide
example : damThousandthFee 1_000_000 = 1_000 := by decide
example : pfcThousandthFee 999 = 0 := by decide
example : pfcThousandthFee 1000 = 1 := by decide
example : treeThousandthFee 1000 = 1 := by decide
example : portThousandthFee 1000 = 1 := by decide

-- 5/1000: 999→4, 1000→5, 12345→61, 1000000→5000
example : damFiveThousandthsFee 999 = 4 := by decide
example : damFiveThousandthsFee 1000 = 5 := by decide
example : damFiveThousandthsFee 12_345 = 61 := by decide
example : damFiveThousandthsFee 1_000_000 = 5_000 := by decide
example : pfcFiveThousandthsFee 1000 = 5 := by decide
example : treeFiveThousandthsFee 1000 = 5 := by decide
example : portFiveThousandthsFee 1000 = 5 := by decide

-- 4/1000: 999→3, 1000→4, 12345→49, 1000000→4000
example : damFourThousandthsFee 999 = 3 := by decide
example : damFourThousandthsFee 1000 = 4 := by decide
example : damFourThousandthsFee 12_345 = 49 := by decide
example : damFourThousandthsFee 1_000_000 = 4_000 := by decide
example : pfcFourThousandthsFee 1000 = 4 := by decide
example : treeFourThousandthsFee 1000 = 4 := by decide
example : portFourThousandthsFee 1000 = 4 := by decide

-- 2/1000: 999→1, 1000→2, 12345→24, 1000000→2000
example : damTwoThousandthsFee 999 = 1 := by decide
example : damTwoThousandthsFee 1000 = 2 := by decide
example : damTwoThousandthsFee 12_345 = 24 := by decide
example : damTwoThousandthsFee 1_000_000 = 2_000 := by decide
example : pfcTwoThousandthsFee 1000 = 2 := by decide
example : treeTwoThousandthsFee 1000 = 2 := by decide
example : portTwoThousandthsFee 1000 = 2 := by decide

end JapanTaxLaw.RegistryPropertyRightsFees
