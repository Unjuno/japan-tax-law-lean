import Std
import JapanTaxLaw.TaxFinance

/-
# DocumentAgeSixMonthCap — 国外送金等調書提出法律施行規則 第四条 第四項 第三号 ハ
（官公署書類のうち提示日前六月以内に作成されたもの）

Pinned sources:
  Law id: 409M50000040096 (内国税の適正な課税の確保を図るための国外送金等に
    係る調書の提出等に関する法律施行規則)
  Revision: 409M50000040096_20250401_507M60000040027
  Raw snapshot: data/raw/409M50000040096_20250401_507M60000040027.law.json
  Article Num 4, Paragraph 4, Item 3, Subitem ハ (Subitem1#3), Sentence 1.
  source_path: LawBody[3]/MainProvision/MainProvision[1]/Article:4/Article#4/Paragraph#4/Item#3/Subitem1#3/Subitem1Sentence/Sentence#1
  Normative unit: NORM|fbe6e3f9390978accfca8139fb361f470a3b730d1ff6137bdae45159d38175c4

Verbatim 原文 needle (the full unit leaf, unique in scoped Article 4):
  「官公署から発行され、又は発給された書類その他これらに類するもの（金融機関の営業所等の長に提示する日前六月以内に作成されたもの（有効期間又は有効期限のあるものにあっては、金融機関の営業所等の長に提示する日において有効なもの）に限り、法人番号通知書、法人番号印刷書類並びにイ及びロに掲げる書類を除く。）」

Variable contract:
  created      = 書類の作成月 (caller-established month ordinal)
  presentation = 金融機関の営業所等の長に提示する月 (caller-established month ordinal)
  lookback     = 六月 = 6 months
  freshDocs created presentation =
      created <= presentation ∧ presentation <= created + 6

This is a two-sided recency predicate: the document must not be from the
future and must be no older than six months before presentation. Months are
caller-established ordinals; calendar-day/leap-year arithmetic is out of scope.

Scope: ONLY this six-month lookback predicate. Sibling イ (六月以内に交付を
受けたもの), sibling ロ, the enumerated exclusions (法人番号通知書, 法人番号
印刷書類, イ・ロ書類), the validity-at-presentation branch for documents with
an expiry, and all other articles/laws are NOT MODELLED. No legal review.
-/

namespace JapanTaxLaw.DocumentAgeSixMonthCap

/-- 原文の「六」= 6 月（遡及上限）。 -/
def lookbackMonths : Nat := 6

/-- 提示日前六月以内に作成されたか（未来・6月超を除外）。 -/
def freshDocs (created : Nat) (presentation : Nat) : Bool :=
  created <= presentation && presentation <= created + lookbackMonths

theorem lookback_is_six : lookbackMonths = 6 := rfl

-- 境界: 0 / 6 / 7 月前
theorem same_month : freshDocs 0 0 = true := by decide
theorem at_lookback : freshDocs 0 6 = true := by decide
theorem beyond_lookback : freshDocs 0 7 = false := by decide

-- シフトした提示月
theorem shifted_within : freshDocs 5 10 = true := by decide
theorem shifted_boundary : freshDocs 3 10 = false := by decide
theorem future_document : freshDocs 11 10 = false := by decide

end JapanTaxLaw.DocumentAgeSixMonthCap
