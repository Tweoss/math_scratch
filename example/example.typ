#import "../template.typ": *
#show: homework.with(
  class: "MATH 62CM",
  number: 9,
  date: "March 2023"
)

#problem[
  Let $gamma = (gamma_1, gamma_2): [0, 2pi] -> RR^2 \\ {(-1, 0), (1, 0)}$ be a loop such that its winding number around the point $(-1, 0)$ is equal to $2$, and its winding number around the point $(1, 0)$ is equal to $-3$. Compute the linking number $op("lk")(phi.alt, psi)$ of the loops $ phi.alt(s) = (cos s, sin s, 0) "and" psi(gamma_1(t), 0, gamma_2(t))|s,t in [0, 2pi] $
]

#solution[
  We have that the linking number is the degree of a map $f(phi.alt, psi) : sq(T) -> sq(S)$ given by $f(phi.alt, psi) = (gamma_1(phi.alt) - gamma_2(psi)) / (|gamma_1(phi.alt) - gamma_2(psi)|)$. To determine the linking number, we take the sum of the sign of the preimages of some point on the sphere. 
 
  Take the ray coming out of the page, along the y-axis as below. We conclude the linking nunber is $+5$. There are $5$ crossings where we can cast a ray form the red curve through the blue curve such that the ray comes out of the page. We have that the orientation of these curves matches, and that the sign is positive. 

  #figure(image("linking.png", width: 80%),
  caption: [
    View of loops from the positive y-axis
  ]) <linking>
]

#problem[
  Prove that any Morse function (i.e. a function with non-degenerate critical points) $f: sq(T) -> RR$ has at least $4$ critical points. 
]

#solution[
  Parametrize the torus by $theta, phi.alt$. Take $f_theta(phi.alt) = f(theta, phi.alt)$. Then, we can maximize or minimize $f_theta(phi.alt)$ with respect to $phi.alt$ and with respect to $theta$ individually. 

  We have that $limits(max)_theta (limits(max)_phi.alt f_theta) = limits(max)_(sq(T)) f = f(p_(++))$ for some point $p_(++)$. Define $p_(+-)$ to be a point such that $f(p_(+-)) = limits(max)_theta(limits(min)_phi.alt f_theta)$ and vice versa for $p_(-+)$. Define $p_(--)$ to be the global minimum on the torus. By definition, there exists at least one point for us to choose for each of these combinations. 

  If we have that for two of these points $p_1 = p_2$, then we have that $limits(min)_phi.alt f_theta = limits(max)_phi.alt f_theta$, $limits(max)_theta (min " or " max f_theta) = limits(min)_theta(min " or " max f_theta)$, or both. Intuitively, this would mean that along some path, $f$ is constant and thus not Morse. 

  If the first is true, then for some $theta$, the function $f_theta$ is constant with respect to $phi.alt$. Then, the Jacobian has entry $0$ for the partial with respect to $theta$, and thus the Hessian has determinant $0$. This means the function is degenerate and thus not Morse. 

  If the second is true, then one of $min f_theta$, or $max f_theta$ with respect to $phi.alt$ is constant with respect to $theta$. Then, again, we have a $0$ for the partial with respect to $theta$ in the Jacobian and $f$ is thus not Morse. 
]

#problem[
  + Find a vector field $Z$ tangent to $sq(S)$ which has exactly $1$ zero of index $2$. 
  + Find a vector field tangent to $S^(2n-1)$ which has no zeroes.
]

#solution(level: 1)[
  Define a vector field on $sq(RR)$ as $(1/(x^2+y^2+1), 0)$. This vector field always points to the right and has magnitude that goes to $0$ at infinity. Then, take the map from $RR^2$ to $S^2$ as the projection by the north pole. This is a diffeomorphism, and we use it to map the vector field onto the sphere. At the north pole, the projection is undefined, so we take the vector field to be $0$ there. Because the vector field on $RR^2$ decreases to $0$ at infinity, the vector field on $S^2$ decreases to $0$ near the north pole. 

  The vectors near the north pole look as in below. 
  
  #figure(image("projection.png", width: 80%),
  caption: [
    Vector field near the north pole
  ]) <projection>

  We can see that the vector field wraps around twice counterclockwise near the $0$ that is the north pole. Everywhere else, the vector field is defined to be nonzero, so there is exactly one $0$ of index $2$ on the sphere. 
]

#solution(level: 1)[
  Take the vector field $(-y_1, x_1, -y_2, x_2, dots)$. Evidently, this is perpendicular to the vector $(x_1, y_1, x_2, y_2, dots)$ since the dot product of the two is $0$. Therefore, the vector field is tangent to $S^(2n-1)$. Since we are on the sphere, at least one of these coordinates must be nonzero for $x^2_1 + y^2_1 + x^2_2 + y^2_2 + ... = 1$ to be true. Therefore, the vector field is also nonzero on the sphere. 
]

#pagebreak()

#problem[Show that there are no degree $1$ maps $f: S^2 -> T^2$.]

#solution[
  Take the area form $d theta and d phi.alt$. Then, we can scale this form to obtain a form $alpha and beta$ such that $integral_(T^2) alpha and beta = 1$. Then, for any $f$ from $S^2->T^2$, we have that $integral_(S^2) f^*(alpha and beta) = integral_(S^2) f^*(alpha) and f^*(beta)$. The value of this integral is the degree of $f$. Because the sphere is a compact orientable and connected manifold with an empty boundary, we have that the first Betti number of the sphere is $0$ from notes. Therefore, the closed form $f^*(alpha) and f^*(beta) = d omega$, an exact form for some $omega$. Then, we can take the integral over the boundary of the sphere of $omega$ by Stokes' Theorem. Then, we can take the integral over the boundary of the sphere by Stokes' Theorem of $omega$. The boundary is empty, so the integral is $0$, and thus the degree of the map $f$ is not $1$. 
]
