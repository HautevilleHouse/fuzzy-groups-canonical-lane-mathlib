import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySubgroupLattice {G : Type u} [Group G] where
  fuzzySubgroups : Set (FuzzySetMembership G)
  meet : FuzzySetMembership G → FuzzySetMembership G → FuzzySetMembership G
  join : FuzzySetMembership G → FuzzySetMembership G → FuzzySetMembership G
  latticeLaws : Prop

structure FuzzySubgroupLatticeEvidence (L : FuzzySubgroupLattice) where
  latticeLawsClosed : L.latticeLaws

def FuzzySubgroupLatticeClosed (L : FuzzySubgroupLattice) : Prop :=
  L.latticeLaws

theorem fuzzy_subgroup_lattice_closed_from_evidence (L : FuzzySubgroupLattice)
    (E : FuzzySubgroupLatticeEvidence L) : FuzzySubgroupLatticeClosed L :=
  E.latticeLawsClosed

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse