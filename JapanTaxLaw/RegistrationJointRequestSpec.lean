/-!
# RegistrationJointRequestSpec — 独立形式仕様

このモジュールは `RegistrationJointRequest.lean` の実装定数を一切 import せず、
pinned 原文（322CO0000000109 art.3）から独立に読み取った仕様を与える。
対応は `agrees_with_implementation` でカーネル検証する（循環証明を避けるため
仕様側は実装の名前・値を参照しない）。

原文の対応:
  - 「前二条の場合において」        → priorCase = true
  - 「同一の登記所の管轄内に在る」  → sameRegistry = true
  - 「二箇以上の不動産」            → 2 <= propertyCount（Nat、単位: 個）
  - 「登記原因又は登記の目的が同一でなくても」 → 異同を条件に含めない
  - 「同一の嘱託書で…嘱託することができる」 → permitted
-/
namespace JapanTaxLaw.RegistrationJointRequestSpec

/-- 原文から独立に導いた許容条件（Prop）。実装を参照しない。 -/
def permitted (priorCase : Bool) (sameRegistry : Bool) (propertyCount : Nat) : Prop :=
  priorCase = true ∧ sameRegistry = true ∧ 2 <= propertyCount

/-- 原文「同一でなくても」: 原因・目的の異同は許容条件を変化させない。 -/
def differenceIsNotABar (_d : Bool) : Prop := True

end JapanTaxLaw.RegistrationJointRequestSpec
