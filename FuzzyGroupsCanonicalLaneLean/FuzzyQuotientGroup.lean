import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyQuotientGroupPackage {G : Type} [Group G] {FG : FuzzyGroup G} {S : FuzzySubgroupPackage FG} (N : FuzzyNormalSubgroupPackage S) where
  quotient_set : G → ℝ
  well_defined : ∀ x y : G, (G.mul (G.inv x) y) ∈ (fun z => S.carrier z = 1) → quotient_set x = quotient_set y
  compatibility : ∀ x : G, quotient_set x = FG.carrier.membership x

structure FuzzyQuotientGroupEvidence {G : Type} [Group G] {FG : FuzzyGroup G} {S : FuzzySubgroupPackage FG} {N : FuzzyNormalSubgroupPackage S} (Q : FuzzyQuotientGroupPackage N) where
  well_defined_closed : Q.well_defined
  compatibility_closed : Q.compatibility

def FuzzyQuotientGroupClosed {G : Type} [Group G] {FG : FuzzyGroup G} {S : FuzzySubgroupPackage FG} {N : FuzzyNormalSubgroupPackage S} (Q : FuzzyQuotientGroupPackage N) : Prop :=
  Q.well_defined ∧ Q.compatibility

theorem fuzzy_quotient_group_closed_from_evidence
    {G : Type} [Group G] {FG : FuzzyGroup G} {S : FuzzySubgroupPackage FG} {N : FuzzyNormalSubgroupPackage S}
    (Q : FuzzyQuotientGroupPackage N) (E : FuzzyQuotientGroupEvidence Q) :
    FuzzyQuotientGroupClosed Q := by
  exact And.intro E.well_defined_closed E.compatibility_closed

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse