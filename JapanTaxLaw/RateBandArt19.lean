/-!
# RateBandArt19 — 347CO0000000151 art.19（別表の金額帯）

Sources (pinned):
  Law id: 347CO0000000151, revision 347CO0000000151_20251231_507CO0000000426
  Raw snapshot: data/raw/347CO0000000151_20251231_507CO0000000426.law.json
  source_path: LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1

  原文（一字一句、15文字、独立抽出で照合済み）:
  「千万円以上千五百万円未満の金額」

  規範単位（CONDITION、別表セル）:
    - 下限: 千万円以上 → lowerYen <= amount（境界を含む）
    - 上限: 千五百万円未満 → amount < upperYenExclusive（境界を含まない）
    - 変数 amount は金額（円、非負整数、caller-established）。
  当該セルの税率・他の金額帯・算定手続は当該単位外で NOT MODELLED。
-/
namespace JapanTaxLaw.RateBandArt19

/-- 原文「千万円」（円）。下限（以上、境界を含む）。 -/
def lowerYen : Nat := 10_000_000

/-- 原文「千五百万円」（円）。上限（未満、境界を含まない）。 -/
def upperYenExclusive : Nat := 15_000_000

/-- 原文の金額帯条件。 -/
def inBand (amount : Nat) : Bool :=
  decide (lowerYen <= amount && amount < upperYenExclusive)

theorem lower_lt_upper : lowerYen < upperYenExclusive := by decide

/-- 境界: 下限ちょうどは該当。 -/
theorem includes_lower : inBand 10_000_000 = true := by decide

/-- 境界: 上限ちょうどは非該当（未満）。 -/
theorem excludes_upper : inBand 15_000_000 = false := by decide

/-- 帯の内側は該当、外側は非該当。 -/
theorem includes_interior : inBand 12_000_000 = true := by decide
theorem excludes_below : inBand 9_999_999 = false := by decide
theorem excludes_above : inBand 15_000_001 = false := by decide

/-- 一般命題: inBand は原文の不等式と同値。 -/
theorem inBand_iff (amount : Nat) :
    inBand amount = true ↔ lowerYen <= amount ∧ amount < upperYenExclusive := by
  simp [inBand]

end JapanTaxLaw.RateBandArt19
