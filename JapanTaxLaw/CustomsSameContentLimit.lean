import JapanTaxLaw.TaxFinance

/-!
# CustomsSameContentLimit — 関税定率法 art.14 第十七号 ただし書（同内容二本以内）

Pinned source:
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|4f809b7fbadedd5606d99bdd90eff711ca1b77bc66fc8a481845a6c117dba46d
  Source path: LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/
               Paragraph#1/Item#17/ItemSentence/Sentence#2
  Statutory article: art. 14 (無条件免税), item 17 proviso

原文逐語（pinned, 一字一句改変なし）:
  「ただし、内容を同じくするものについては、そのうちの二本以内に限る。」

Norm kind: EXCEPTION. It restricts the main rule (無条件免税) to at most two
items of identical content. The main rule itself and the 政令 procedure are
NOT MODELLED; only the exception's quantitative scope is.

Variable contract:
  `count : Money` = 内容を同じくする物品の数, unit 本 (items),
  domain Nat (non-negative integers). `Money` is reused here as a plain Nat
  count, NOT as a yen amount: the unit is 本, documented here so that `2`
  cannot be misread as ¥2.
  Result: Bool — whether the count is within the exception's limit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsSameContentLimit

open JapanTaxLaw.TaxFinance

/-- 「二本以内」. Unit: 本 (items); domain Nat. -/
def sameContentLimit : Money := 2

/-- 例外の適用範囲: 同内容の物品数が上限以下かどうか. -/
def withinSameContentLimit (count : Money) : Bool :=
  count ≤ sameContentLimit

end JapanTaxLaw.CustomsSameContentLimit
