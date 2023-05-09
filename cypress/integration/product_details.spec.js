describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("navigates from the homepage to the product detail page by clicking on a product", () => {
    cy.get(".products article").first().click()

    cy.get(".product-detail").should("be.visible")
  });


})
