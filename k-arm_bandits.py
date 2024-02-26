#implement k-arm bandits algorithm
import numpy as np
class KArmBandits:
    def __init__(self,k, epsilon=0.1, alpha=0.5):
        """
        Initialize the k-arm bandits.

        Parameters:
        k (int): The number of arms in the bandits problem.
        epsilon (float): The probability of exploring (default: 0.1).
        alpha (float): The learning rate (default: 0.5).
        """
        self.k = k
        self.epsilon = epsilon
        self.alpha = alpha
        self.Q = np.zeros(k)
        self.N = np.zeros(k, dtype=int)

    def choose_arm(self):
        """
        Choose an arm to pull based on the epsilon-greedy algorithm.

        Returns:
        int: The index of the chosen arm.
        """
        if np.random.random() < self.epsilon:
            # Explore
            return np.random.choice(self.k)
        else:
            # Exploit
            return np.argmax(self.Q)

    def update(self, arm, reward):
        """
        Update the Q-value and number of pulls for the given arm.

        Parameters:
        arm (int): The index of the arm that was pulled.
        reward (float): The reward received from pulling the arm.
        """
        self.N[arm] += 1
        self.Q[arm] += (1 / self.N[arm]) * (reward - self.Q[arm])

    def simulate(self, num_episodes=1000):
        """
        Simulate the k-arm bandits algorithm for a given number of episodes.

        Parameters:
        num_episodes (int): The number of episodes to simulate (default: 1000).
        """
        for _ in range(num_episodes):
            arm = self.choose_arm()
            reward = np.random.rand()  # Assume random rewards between 0 and 1
            self.update(arm, reward)