import JapanTaxLaw.CollectionTaxpayer

/-!
# CollectionTaxpayer tests — 国税徴収法 Act art. 2 item 6 smoke checks

Decidable smoke checks for the item 6 (納税者) actor-scope model.
Note: the lack of an exclusion clause in the source text is reflected in the
absence of exclusion tests here; the model deliberately does not invent one.
-/

namespace JapanTaxLaw

-- 両トラックが確立 ⇒ 納税者
example : isCollectionTaxpayer { owesDirectly := .yes, mustCollectAndPay := .yes } = Verdict.yes := by decide
example : isCollectionTaxpayer { owesDirectly := .unknown, mustCollectAndPay := .yes } = Verdict.yes := by decide
example : isCollectionTaxpayer { owesDirectly := .yes, mustCollectAndPay := .unknown } = Verdict.yes := by decide
-- どちらか一方でも .yes ⇒ 納税者（"及び" は二つの十分条件を結合）
example : classifyCollectionTaxpayer { owesDirectly := .yes, mustCollectAndPay := .no } = .taxpayer := by decide
example : classifyCollectionTaxpayer { owesDirectly := .no, mustCollectAndPay := .yes } = .taxpayer := by decide
-- どちらも no ⇒ 納税者でない
example : classifyCollectionTaxpayer { owesDirectly := .no, mustCollectAndPay := .no } = .notTaxpayer := by decide
-- unknown かつ非-yes ⇒ 判定不能
example : classifyCollectionTaxpayer { owesDirectly := .unknown, mustCollectAndPay := .no } = .undetermined := by decide
example : classifyCollectionTaxpayer { owesDirectly := .no, mustCollectAndPay := .unknown } = .undetermined := by decide
-- 一方が矛盾 ⇒ 判定不能 (conflict)
example : classifyCollectionTaxpayer { owesDirectly := .conflict, mustCollectAndPay := .no } = .inconsistent := by decide
example : classifyCollectionTaxpayer { owesDirectly := .no, mustCollectAndPay := .conflict } = .inconsistent := by decide
-- unknown かつ矛盾 ⇒ 判定不能 (conflict 優先)
example : classifyCollectionTaxpayer { owesDirectly := .conflict, mustCollectAndPay := .unknown } = .inconsistent := by decide
-- 両方が yes でも, 片方 + 不明でも yes（unknown を or-吸収）
example : isCollectionTaxpayer { owesDirectly := .yes, mustCollectAndPay := .conflict } = Verdict.yes := by decide
example : isCollectionTaxpayer { owesDirectly := .conflict, mustCollectAndPay := .yes } = Verdict.yes := by decide

end JapanTaxLaw
