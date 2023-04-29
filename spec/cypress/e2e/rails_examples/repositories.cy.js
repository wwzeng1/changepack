describe('Repositories', function() {
  beforeEach(() => {
    cy.app('clean')
  })

  it('happy path', function() {
    cy.appFactories([['create', 'user']]).then(users => {
      const user = users[0]

      cy.appFactories([['create', 'access_token', { account_id: user.account_id }]])
      cy.login({ email: user.email })
      cy.visit('/repositories')
      cy.get('[data-test-id="blank"]').should('be.visible')

      cy.appFactories([['create', 'repository', { account_id: user.account_id }]])
      cy.visit('/repositories')
      cy.get('[data-test-id="repository"]').should('be.visible')

      cy.contains('Pull commits').should('be.visible')
      cy.get('[data-test-id="pull_commits"]').click()
      cy.get('[data-test-id="confirm_pull"]').click()
      cy.contains('Stop tracking').should('be.visible')

      cy.get('[data-test-id="stop_tracking"]').click()
      cy.get('[data-test-id="confirm_stop"]').click()
      cy.contains('Pull commits').should('be.visible')
    })
  })

  it('unhappy path', function() {
    cy.appFactories([['create', 'user']]).then(users => {
      const user = users[0]

      cy.login({ email: user.email })
      cy.visit('/repositories')
      cy.get('[data-test-id="intro"]').should('be.visible')
    })
  })
})
