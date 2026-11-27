import JapanTaxLaw.TaxFinance

/-
# InheritanceTax46InKindRevocationTwoOrMore — pinned clause 「税務署長は、前項の場合において、物納の許可があつた二以上の不動産の一部について物納の撤回の申請があり、又は物納の許可があつた一の不動産を分割してその一部について物納の撤回の申請があつたとき（これらの申請のあつた財産以外の物納財産のうちにその物納の撤回により管理又は処分をするのに不適格な財産として政令で定めるもの（以下この条において「不適格財産」という。）があるときに限る。）は、当該不適格財産を物納の撤回の申請に係る財産に追加することを求め、当該申請者が当該財産に当該不適格財産」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 46, paragraph 4.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|23d5b399018f6fb54178cee3e076a28032e3b87796c6f0f079310846fe1ca92f.
Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:46/Article#46/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「税務署長は、前項の場合において、物納の許可があつた二以上の不動産の一部について物納の撤回の申請があり、又は物納の許可があつた一の不動産を分割してその一部について物納の撤回の申請があつたとき（これらの申請のあつた財産以外の物納財産のうちにその物納の撤回により管理又は処分をするのに不適格な財産として政令で定めるもの（以下この条において「不適格財産」という。）があるときに限る。）は、当該不適格財産を物納の撤回の申請に係る財産に追加することを求め、当該申請者が当該財産に当該不適格財産」
Scope: ONLY the 物納の許可があつた二以上の不動産 (properties ≥ 2) INCLUSIVE lower bound for the 物納の撤回の申請 with 不適格財産追加. 一の不動産の分割・不適格財産の政令定義・追加要求の効果・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax46InKindRevocationTwoOrMore

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「税務署長は、前項の場合において、物納の許可があつた二以上の不動産の一部について物納の撤回の申請があり、又は物納の許可があつた一の不動産を分割してその一部について物納の撤回の申請があつたとき（これらの申請のあつた財産以外の物納財産のうちにその物納の撤回により管理又は処分をするのに不適格な財産として政令で定めるもの（以下この条において「不適格財産」という。）があるときに限る。）は、当該不適格財産を物納の撤回の申請に係る財産に追加することを求め、当該申請者が当該財産に当該不適格財産」. -/
def inScope (properties : Nat) : Prop := threshold ≤ properties

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (properties : Nat) : Bool := decide (2 ≤ properties)

end JapanTaxLaw.InheritanceTax46InKindRevocationTwoOrMore
