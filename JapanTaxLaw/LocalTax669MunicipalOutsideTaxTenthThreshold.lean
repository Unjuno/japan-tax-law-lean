import JapanTaxLaw.TaxFinance

/-
# LocalTax669MunicipalOutsideTaxTenthThreshold — pinned clause 「市町村は、当該市町村の市町村法定外普通税の一の納税義務者（納税義務者となるべき者を含む。以下本項において同じ。）であつて当該納税義務者に対して課すべき当該市町村法定外普通税の課税標準の合計が当該市町村法定外普通税の課税標準の合計の十分の一を継続的に超えると見込まれる者として総務省令で定めるもの（以下本項において「特定納税義務者」という。）であるものがある場合において、当該市町村法定外普通税の新設又は変更をする旨の条例を制定しようとするときは、当該市町村の議会において、当該特定納税義務者の意見を聴くものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 669, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|249880341d49f5964b82636c9c5e437fcad90066e66ed829c5843e4eeb181bb7.
原文逐語: 「市町村は、当該市町村の市町村法定外普通税の一の納税義務者（納税義務者となるべき者を含む。以下本項において同じ。）であつて当該納税義務者に対して課すべき当該市町村法定外普通税の課税標準の合計が当該市町村法定外普通税の課税標準の合計の十分の一を継続的に超えると見込まれる者として総務省令で定めるもの（以下本項において「特定納税義務者」という。）であるものがある場合において、当該市町村法定外普通税の新設又は変更をする旨の条例を制定しようとするときは、当該市町村の議会において、当該特定納税義務者の意見を聴くものとする。」
Scope: ONLY the 市町村法定外普通税の一の納税義務者の課税標準の合計が全体の十分の一を継続的に超える STRICT 下限（10 * share > total）. 継続性の判定・総務省令の指定・議会での意見聴取手続・他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax669MunicipalOutsideTaxTenthThreshold

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (10) with the inclusive/strict boundary fixed by the clause. -/
def inScope (share total : Nat) : Prop := 10 * share > total

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (share total : Nat) : Bool := decide (10 * share > total)

end JapanTaxLaw.LocalTax669MunicipalOutsideTaxTenthThreshold
