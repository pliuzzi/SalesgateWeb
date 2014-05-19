package eu.a2a.salesgate.security.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class User extends CodDescBean {

  private static final long serialVersionUID = 7703279626457721050L;

  private String firstName;
  private String lastName;
  private String username;
  private String email;

  public User() {

  }

  public User(String id, String firstName, String lastName, String username, String email) {
    super(id);
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
    this.email = email;
  }

  public String getEmail() {
    return email;
  }

  public String getFirstName() {
    return firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public String getUsername() {
    return username;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  @Override
  public String toString() {
    return "User [firstName=" + firstName + ", lastName=" + lastName + ", username=" + username + ", email=" + email + ", getId()=" + getId() + ", getDescription()=" + getDescription() + "]";
  }

}
