describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("adds one to the cart when product add to cart button is clicked", () => {
    cy.get(".navbar").contains('My Cart (0)')

    cy.get(".products article .button_to .btn").first().click({force: true})

    cy.get(".navbar").contains('My Cart (1)')
  });


})
